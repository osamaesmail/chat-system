package main

import (
	"github.com/labstack/echo"
	"chat-creation-endpoint/controllers"
	"github.com/go-redis/redis"
)

func initRoutes(e *echo.Echo, client *redis.Client) {	
	e.POST("/applications/:token/chats", controllers.ChatController{client}.Post)
	e.POST("/applications/:token/chats/:chat_number/messages", controllers.MessageController{client}.Post)
}