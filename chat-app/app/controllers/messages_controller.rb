class MessagesController < ApplicationController
  before_action :set_application
  before_action :set_application_chat
  before_action :set_application_chat_message, only: [:show, :update]

  # GET /applications/:token/chats/:number/messages
  def index
    messages = @chat.messages.paginate(pagination_params)
    json_response(messages)
  end

  # GET /applications/:token/chats/:number/messages/:number
  def show
    json_response(@message)
  end

  # PUT /applications/:token/chats/:number/messages/:number
  def update
    begin
      @message.update!(message_params)
      head :no_content
    rescue Faraday::ConnectionFailed => e # skip elasticsearch connection problem
      puts e
      json_response(message_params, :created)
    end
  end

  # POST /applications/:token/chats/:number/messages/search
  def search
    begin
      keyword = params[:keyword]
      messages = Message.search(keyword)
      json_response(messages)
    rescue Faraday::ConnectionFailed => e # skip elasticsearch connection problem
      puts e
      json_response([])
    end
  end

  private

  def message_params
    params.permit(:name, :number)
  end

  def set_application
    @application = Application.find_by!(token: params[:application_token])
  end

  def set_application_chat
    @chat = @application.chats.find_by!(number: params[:chat_number]) if @application
  end

  def set_application_chat_message
    @message = @chat.messages.find_by!(number: params[:number]) if @chat
  end
end
