Rails.application.routes.draw do
  devise_for :users

  unauthenticated do
    as :user do
      root to: 'devise/sessions#new'
    end
  end

  namespace :requestor do
    resources :dashboard, only: %i[index]
    resources :jobs, except: %i[delete edit update] do
      resources :evaluation, only: %i[new create]
    end
  end

  namespace :admin do
    resources :dashboard, only: %i[index]
    resources :jobs, only: %i[index show edit update] do
      resources :remarks, only: %i[create]
    end

  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
