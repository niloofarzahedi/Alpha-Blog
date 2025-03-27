Rails.application.routes.draw do
  root 'pages#home'
  devise_for :users, controllers: { 
    registration: 'users/registration',
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks' }
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
  resources :articles
end
