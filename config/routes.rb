Rails.application.routes.draw do

  resources :topics do
    resources :posts, except: [:index]
    resources :sponsored_posts, except: [:index]
  end

  get 'about' => 'welcome#about'
  get 'posts' => 'welcome#posts'
  get 'topics' => 'welcome#topics'

  root 'welcome#index'
  
end
