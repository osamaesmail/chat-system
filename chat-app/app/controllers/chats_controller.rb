class ChatsController < ApplicationController
  before_action :set_application
  before_action :set_application_chat, only: [:show, :update]

  # GET /applications/:token/chats
  def index
    chats = @application.chats.paginate(pagination_params)
    json_response(chats)
  end

  # GET /applications/:token/chats/:number
  def show
    json_response(@chat)
  end

  # PUT /applications/:token/chats/:number
  def update
    @chat.update!(chat_params)
    head :no_content
  end

  private

  def chat_params
    params.permit(:name, :number)
  end

  def set_application
    @application = Application.find_by!(token: params[:application_token])
  end

  def set_application_chat
    @chat = @application.chats.find_by!(number: params[:number]) if @application
  end
end
