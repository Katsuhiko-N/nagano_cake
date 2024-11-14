Rails.application.routes.draw do
  root to: 'homes#top'
  
  # customer側各機能
  scope module: :public do
    # カスタマー(ユーザー)関係
    resources :customers, except: [:new, :index, :delete] do
      member do
        get 'unsubscribe'
        patch 'withdraw'
      end
    end
    
    # ジャンル機能
    resources :genres, except: [:new, :destroy]
    
    # 商品機能
    resources :items, only: [:index, :show]
    
    # 住所機能
    resources :addresses, except: [:new, :show]
    
    # カート機能
    resources :cart_items, except: [:new, :show]
    
    # 注文機能
    resources :orders, only: [:new, :create] do
      collection do
        get 'confirm'
        get 'thanks'
      end
    end
    
  end
  
  
  
  # admin側各機能
  namespace :admin do

    resources :genres, except: [:new, :show, :destroy]
    resources :items
    resources :customers, except: [:new, :create, :destroy]
    resources :orders, only:[:index, :show]
    resources :order_details
  end
  
  
  
    # customer用(名前空間はpublic)
  devise_for :customer, skip:[:passwords], controllers:{
    registrations: "public/registrations",
    sessions: "public/sessions"
  }
  
  
    # admin用
  devise_for :admin, skip:[:registrations, :passwords], controllers:{
    sessions: "admin/sessions"
  }
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
