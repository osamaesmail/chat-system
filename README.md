## Requirements

* Docker
* Docker Compose

## Starting services
```bash
sh docker-deploy.sh
```

## Stopping services

* Run the following command:
```bash
sudo docker-compose down
```

## Endpoints
### Applications

* Create application
###### request
```
POST http://localhost:3000/applications
{
  name: "application name"
}
```

* Get applications
    * By default, It return 100 application in page 1
###### request
```
GET http://localhost:3000/applications
```

* Get applications with pagination
###### request
```
GET http://localhost:3000/applications?page={page_number}&per_page={per_page}
```

* Get application
###### request
```
GET http://localhost:3000/applications/{application_token}
```

* Update application
###### request
```
PUT http://localhost:3000/applications/{application_token}
{
  name: "updated application name"
}
```

* Create chat formatting
###### request
```
POST http://localhost:3001/applications/{application_token}/chats
{}
```

### Chats

* Get chats
    * By default, It return 100 chat in page 1
###### request
```
GET http://localhost:3000/applications/{application_token}/chats
```

* Get chats with pagination
###### request
```
GET http://localhost:3000/applications/{application_token}/chats?page={page_number}&per_page={per_page}
```

* Get chat
###### request
```
GET http://localhost:3000/applications/{application_token}/chats/{chat_number}
```

* Update chat
###### request
```
PUT http://localhost:3000/applications/{application_token}/chats/{chat_number}
{
  name: "updated chat name"
}
```

### Messages

* Create message
###### request
```
POST http://localhost:3001/applications/{application_token}/chats/{chat_number}/messages
{
  body: "hi"
}
```

* Get messages
    * By default, It return 100 message in page 1
###### request
```
GET http://localhost:3000/applications/{application_token}/chats/{chat_number}/messages
```

* Get messages with pagination
###### request
```
GET http://localhost:3000/applications/{application_token}/chats/{chat_number}/messages?page={page_number}&per_page={per_page}
```

* Get message
###### request
```
GET http://localhost:3000/applications/{application_token}/chats/{chat_number}/messages/{message_number}
```

* Update message
###### request
```
PUT http://localhost:3000/applications/{application_token}/chats/{chat_number}/messages/{message_number}
{
    "name": "updated message 1"
}
```

* Search in messages
###### request
```
POST http://localhost:3000/applications/{application_token}/chats/{chat_number}/messages/search
{
	"keyword": "partial message name"
}
```
