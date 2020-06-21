Rails.application.routes.draw do
	
  devise_for :users
  resources :users, only: [:index, :show, :edit, :update]
  get '/users/:id/index_follow' => 'users#index_follow', as: 'index_follow'
  get '/users/:id/index_follower' => 'users#index_follower', as: 'index_follower'
  resources :books do
  	resource :favorites, only: [:create, :destroy]
  	resources :book_comments, only: [:create, :destroy]
  end
  post 'follow/:id' => 'relationships#create', as: 'follow' # フォローする
  post 'unfollow/:id' => 'relationships#destroy', as: 'unfollow' # フォロー外す

  get '/home/about' => 'homes#about'
  root 'homes#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end