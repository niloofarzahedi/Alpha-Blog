Rails.application.routes.draw do
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
  resources :articles
end
