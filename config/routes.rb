Rails.application.routes.draw do |map|
  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => 'users/registrations'}
  match '/auth/:provider/callback' => 'users/omniauth_callbacks#create'
end