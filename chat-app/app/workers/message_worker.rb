class MessageWorker
  include Sidekiq::Worker
  
  def perform(*args)
    token = args[0]
    chatNumber = args[1].to_i
    messageCount = args[2].to_i
    body = args[3]
    
    application = Application.where(token: token).first

    if application == nil
      puts "resource not found"
      return
    end

    chat = application.chats.find_by!(number: chatNumber)

    if chat == nil
      puts "resource not found"
      return
    end

    if body == nil 
      body = "-"
    end

    chat.messages.create({
      name: "test",
      number: chatNumber,
      body: body
    })

    chat.update(messages_count: chat.messages_count + 1)

  end
 end