Rails.application.routes.draw do
  
  root to: 'homes#top'
  
  # customer用(名前空間はpublic)
  devise_for :customer, skip:[:passwords], controllers:{
    registrations: "public/registrations",
    sessions: "public/sessions"
  }
  
  scope module: :public do
    # カスタマー関係
    resources :customers, except: [:new, :index, :delete] do
      member do
        get 'unsubscribe'
        patch 'withdraw'
      end
    end
  end
  
  
  # admin用
  devise_for :admin, skip:[:registrations, :passwords], controllers:{
    sessions: "admin/sessions"
  }
  
  namespace :admin do
    root to: 'homes#top'
    resources :genres, except: [:new, :show, :destroy]
    # get 'genres/index' => 'genres#index'
    # post 'genres/create' => 'genres#create'
  end
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
