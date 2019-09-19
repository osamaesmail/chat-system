package main

import (
	"github.com/labstack/echo"
	"chat-creation-endpoint/controllers"
	"github.com/go-redis/redis"
)

func initRoutes(e *echo.Echo, client *redis.Client) {
	g := e.Group("/applications/:token/chats")
	
	g.POST("/", controllers.ChatController{client}.Post)
	g.POST("/:chat_number/messages", controllers.MessageController{client}.Post)
}