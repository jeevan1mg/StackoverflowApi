Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api,  module: 'api/v1' do

    resources :users do
      resources :user_profiles
      resources :questions
      resources :answers
    end

    resources :questions do
      resources :answers
      match 'comment',                         to:  'comment',                             via: :post
    end

    match 'sign_out',                         to:  'sessions#destroy',                     via: :post
    match 'login',                            to:  'sessions#create',                      via: :post
  end
end
