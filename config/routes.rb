Rails.application.routes.draw do
  devise_for :users

  unauthenticated do
    as :user do
      root to: 'devise/sessions#new'
    end
  end

  namespace :requestor do
    resources :dashboard, only: %i[index]
    resources :jobs, except: %i[delete] do
      resources :evaluation, only: %i[new create]
    end
  end

  namespace :admin do
    resources :dashboard, only: %i[index]
    resources :jobs, except: %i[delete]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
