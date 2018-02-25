Rails.application.routes.draw do
  mount Users::UsersAPI => '/api/users'
  resources :users
  root 'users#index'
end
