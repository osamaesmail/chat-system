package controllers

import (
	"fmt"
	"github.com/jrallison/go-workers"
	"github.com/labstack/echo"
	"github.com/go-redis/redis"
	"net/http"
	"strconv"
)

type ChatController struct {
	Client *redis.Client
}

func (controller ChatController) Post(c echo.Context) error {
	token := c.Param("token")
	chatsCountKey := fmt.Sprintf("%s_chats", token)
	chatNumber := controller.Client.Incr(chatsCountKey).Val()

	_, err := workers.Enqueue(
		"default",
		"ChatWorker",
		[]string{token, strconv.FormatInt(chatNumber, 10)})

	if err != nil {
		return c.JSON(http.StatusInternalServerError, err.Error())
	}

	messagesCountKey := fmt.Sprintf("%s_%s_messages", token, strconv.FormatInt(chatNumber, 10))

	err = controller.Client.Set(messagesCountKey, 0, 0).Err()

	if err != nil {
		return c.JSON(http.StatusInternalServerError, err.Error())
	}

	return c.JSON(http.StatusOK, map[string]int64{"chat_number": chatNumber})
}