Rails.application.routes.draw do
  resources :chats do
    resources :messages, param: :chat_id
  end
  get "chat_users/create"
  get "messages/create"
  get "chats/show"
  mount_avo
  devise_for :users, path_names: { sign_in: 'login' }
  namespace :api do
    namespace :v1 do
      resource :profile, only: [:show, :update]
    end
  end
  get "follows/create"
  get "follows/destroy"
  get "likes/create"
  get "likes/destroy"
  get "comments/create"
  get "comments/destroy"
  resources :posts do
    resources :subscribers, only: [:create]
  end
  root 'pages#home'
  resources :articles, only: [ :index, :show, :new, :create, :edit, :update]
end
