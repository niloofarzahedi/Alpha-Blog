Rails.application.routes.draw do
  resources :chats do
    resources :messages, param: :chat_id
  end
  get "chat_users/create"
  get "messages/create"
  get "chats/show"
  mount_avo
  devise_for :users
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
  get "posts/index"
  get "posts/show"
  get "posts/new"
  get "posts/create"
  get "posts/edit"
  get "posts/update"
  get "posts/destroy"
  root 'pages#home'
  resources :articles, only: [ :index, :show, :new, :create, :edit, :update]
end
