Rails.application.routes.draw do
  resources :posts

  get 'about' => 'welcome#about'
  get 'posts' => 'welcome#posts'

  root 'welcome#index'
  
end
