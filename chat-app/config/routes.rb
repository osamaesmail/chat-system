Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :applications, param: :token, only: %i[index create update show] do
    resources :chats, param: :number, only: %i[index update show] do
      resources :messages, param: :number, only: %i[index update show] do
        collection do
          post :search
        end
      end
    end
  end
end
