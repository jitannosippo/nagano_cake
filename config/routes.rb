Rails.application.routes.draw do

  # 顧客用
# URL /customers/sign_in ...
devise_for :customers, controllers: {
  registrations: "public/registrations",
  sessions: "public/sessions"
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, controllers: {
  sessions: "admin/sessions"
}

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  scope module: :public do
    root to: 'homes#top'
    get '/about' => 'homes#about'
    get 'customers/mypage' => 'customers#show'
    get 'customers/information/edit' => 'customers#edit'
    patch 'customers/information' => 'customers#update'
    get 'customers/unsubscribe' => 'customers#unsubscribe'
    patch 'customers/unsubscribe' => 'customers#withdraw'
    post '/orders/comfirmation' => 'orders#comfirmation'
    get '/orders/complete' => 'orders#complete'
    delete '/cart_items' => 'cart_items#destroy_all'

    resources :items
    resources :cart_items
    resources :orders
    resources :addresses
  end


  get '/admin' => 'admin/homes#top'


  namespace :admin do
    resources :genres
    resources :items
    resources :customers
    resources :orders
    patch 'orders/:id' => 'order#update'
    patch 'order_items/:id' => 'order_item#update'
  end





end
