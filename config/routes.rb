Rails.application.routes.draw do
  
  root to: 'homes#top'
  
  # customer用
  devise_for :customer, skip:[:passwords], controllers:{
    registrations: "public/registrations",
    sessions: "public/sessions"
  }
  
  scope module: :public do
    # カスタマー関係
    get 'customers/my_page' => 'customers#show', as: "c_show"
    get 'customers/infomation/edit' => 'customers#edit', as: "c_edit"
    patch 'customers/infomation' => 'customers#update', as: "c_update"
    get 'customers/unsubscribe' => 'customers#unsubscribe', as: "c_unsubscribe"
    patch 'customers/withdraw' => 'customers#withdraw', as: "c_withdraw"
  end
  
  
  # admin用
  devise_for :admin, skip:[:registrations, :passwords], controllers:{
    sessions: "admin/sessions"
  }
  
  namespace :admin do
    root to: 'homes#top'
    get 'genres/index' => 'genres#index'
    post 'genres/create' => 'genres#create'
  end
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
