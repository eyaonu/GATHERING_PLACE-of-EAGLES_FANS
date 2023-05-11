Rails.application.routes.draw do

  devise_for :post_tags
  devise_for :tags
  devise_for :bookmarks
  devise_for :comments
  devise_for :posts
# 利用者(ユーザー)用
  devise_for :users

# 管理者用
  devise_for :admin

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

scope module: :public do
    root to: 'homes#top'
    get '/about' =>'homes#about'
  end

  namespace :admin do
    get '/' => 'homes#top'
  end
end