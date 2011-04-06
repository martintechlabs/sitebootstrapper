Rails.application.routes.draw do |map|
  root :to => "home#index"
  devise_for :users
end