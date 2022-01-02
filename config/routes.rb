Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'public/homes#top'

  scope module: 'public' do
    get '/' => 'homes#top'
    resources :cities, only:[:index]
    resources :columns, only:[:index, :show]
    resources :posts
    get '/users/posts' => 'users#post'
    get '/users/favorites' => 'users#favorite'
    get '/users/confirm' => 'users#confirm'
    get '/users/withdraw' => 'users#withdraw'
    get '/users/my_page' => 'users#show'
    resources :users, only:[:edit, :update]
  end

  namespace :admin do
    get '/' => 'homes#top'
    resources :users, only:[:index, :show]
    get '/columns/confirm' => 'columns#confirm'
    resources :columns, only:[:new, :create ,:show, :index]
  end


end
