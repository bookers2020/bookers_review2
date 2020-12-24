Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'books#top'
  get "search" => "searches#search"
  get "presearch" => "searches#presearch"
  resources :books
end
