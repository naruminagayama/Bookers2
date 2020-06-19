Rails.application.routes.draw do
	
  devise_for :users
  resources :users, only: [:index, :show, :edit, :update]
  resources :books do
  	resource :favorites, only: [:create, :destroy]
  	resources :book_comments, only: [:create, :destroy]
  end

  get '/home/about' => 'homes#about'
  root 'homes#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end