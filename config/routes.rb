Rails.application.routes.draw do

# 利用者(ユーザー)用
  devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
  devise_for :admin,skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

scope module: :public do
    root to: 'homes#top'
    get '/about' =>'homes#about'
    resources :favorite, only: [:index, :create, :update, :destroy] do
      collection do
        delete 'destroy_all'
      end
    end
    get '/users/my_page', to: 'users#show', as: 'users'
    get '/users/my_page/edit', to: 'users#edit', as: 'edit_user'
    get 'users/unsubscribe'
    patch 'users/withdraw'
    resources :users, only: [:create, :index, :update, :destroy, :show] do
      member do
        get 'favorite_posts'
        get 'comment_posts'
        get "search" => "searches#search"
      end
    end
    resources :posts, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
      resources :post_comments, only: [:create, :destroy]
    end
  end

  namespace :admin do
    get '/' => 'homes#top'
    resources :posts, only: [:index, :show]
    resources :users, only: [:index, :show, :edit, :update]
  end
end