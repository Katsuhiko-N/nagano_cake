Rails.application.routes.draw do
  
  # customer用
  devise_for :customer, skip:[:passwords], controllers:{
    registrations: "public/registrations",
    sessions: "public/sessions"
  }
  
  
  
  
  # admin用
  devise_for :admin, skip:[:registrations, :passwords], controllers:{
    sessions: "admin/sessions"
  }
  
  namespace :admin do
    get 'home/top' => 'homes#top', as: "top"
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
