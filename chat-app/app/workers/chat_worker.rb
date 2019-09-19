class ChatWorker
  include Sidekiq::Worker

  def perform(*args)
    token = args[0]
    chatNumber = args[1].to_i
  
    application = Application.where(token: token).first

    if application == nil
      puts "resource not found"
      return 
    end

    application.chats.create({
      number: chatNumber,
      name: "test"
    })

    application.update(chats_count: application.chats_count + 1)
    
  end
 end