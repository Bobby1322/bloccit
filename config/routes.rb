Rails.application.routes.draw do

  resources :posts
  resources :questions

  get 'about' => 'welcome#about'
  get 'posts' => 'welcome#posts'

  root 'welcome#index'
  
end
