package controllers

import (
	"fmt"
	"github.com/jrallison/go-workers"
	"github.com/labstack/echo"
	"github.com/go-redis/redis"
	"net/http"
	"strconv"
)

type MessageController struct {
	Client *redis.Client
}

type Message struct {
	body string `json:"body"`
}

func (controller MessageController) Post(c echo.Context) error {
	token := c.Param("token")
	chatNumber := c.Param("chat_number")
	message := new(Message)

	if err := c.Bind(message); err != nil {
		return c.JSON(http.StatusInternalServerError, err.Error())
	}

	messagesCountKey := fmt.Sprintf("%s_%s_messages", token, chatNumber)

	messageNumber := controller.Client.Incr(messagesCountKey).Val()

	_, err := workers.Enqueue(
		"default",
		"MessageWorker",
		[]string{token, chatNumber, strconv.FormatInt(messageNumber, 10), message.body})

	if err != nil {
		return c.JSON(http.StatusInternalServerError, err.Error())
	}

	return c.JSON(http.StatusOK, map[string]int64{"message_number": messageNumber})
}