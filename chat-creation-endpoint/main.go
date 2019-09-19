package main

import (
	"github.com/labstack/echo"
)

func main()  {
	e := echo.New()
	initRoutes(e, redisClint())
	e.Logger.Fatal(e.Start(":3001"))
}