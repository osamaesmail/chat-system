package main

import (
	"github.com/jrallison/go-workers"
	"github.com/go-redis/redis"
)

func redisClint() *redis.Client {
	redisConnectionString := "redis:6379"

	client := redis.NewClient(&redis.Options{
		Addr: redisConnectionString,
		DB:   0,
	})

	workers.Configure(map[string]string{
		"server":   redisConnectionString,
		"database": "0",
		"pool":     "30",
		"process":  "1",
	})

	return client
}
