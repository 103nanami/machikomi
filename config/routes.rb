Rails.application.routes.draw do
  get 'comments/create'
  get 'comments/destroy'
  devise_for :admins
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'public/homes#top'

  scope module: 'public' do
    get '/' => 'homes#top'
    resources :cities, only:[:index]
    resources :columns, only:[:index, :show] do
      resource :column_favorites, only: [:create, :destroy]
    end
    get '/spots' => 'posts#spot'
    resources :posts do
      resource :post_favorites, only: [:create, :destroy]
      resource :comments, only: [:create]
      resource :comments, only: [:destroy]
    end
    resources :posts, params: :city_id, only: [:index]

    get '/users/posts' => 'users#post'
    get '/users/favorites' => 'users#favorite'
    get '/users/confirm' => 'users#confirm'
    get '/users/withdraw' => 'users#withdraw'
    get '/users/my_page' => 'users#my_page'
    resources :users, only:[:edit, :update]
  end

  namespace :admin do
    get '/' => 'homes#top'
    get 'users/posts' => 'users#post'
    resources :users, only:[:index, :show]
    get 'posts/confirm' => 'posts#confirm'
    resources :posts, only:[:show, :destroy]
    resources :columns, only:[:show, :new, :create, :edit, :update, :destroy] do
      collection do
        get 'search'
      end
    end
  end


end
