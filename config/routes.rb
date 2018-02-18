Rails.application.routes.draw do
  resources :topics do
    resources :posts, except: [:index]
  end

  resources :users, only: [:new, :create]
  post 'users/confirm' => 'users#confirm'

  get 'about' => 'welcome#about'
  get 'posts' => 'welcome#posts'
  get 'topics' => 'welcome#topics'

  root 'welcome#index'
  
end
