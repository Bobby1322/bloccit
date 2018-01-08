Rails.application.routes.draw do
  resources :advertisements
  resources :posts

  get 'about' => 'welcome#about'
  get 'posts' => 'welcome#posts'

  root 'welcome#index'
  
end
