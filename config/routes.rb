Rails.application.routes.draw do
  get 'welcome/index'

  # root针对的是web首页的路由
  # 语法：controller名#对应的方法名
  root "welcome#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users
  resources :sessions
  resources :blogs

  namespace :admin do

    root "users#index"
    resources :users do
      collection do
        get :search
      end
    end
  end
end
