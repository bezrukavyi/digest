Rails.application.routes.draw do
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: '/letter_opener'
  end

  get '422', to: 'stat#unauthorized', as: :unauthorized
  get '404', to: 'stat#not_found', as: :not_found
  get 'dashboard', to: 'dashboard/mailing_lists#show', as: :dashboard_root

  devise_for :users, path: :dashboard, controllers: {
    omniauth_callbacks: 'dashboard/users/omniauth_callbacks'
  }

  namespace :dashboard do
    resources :mailing_lists do
      resources :subscriptions, only: %i[index]
    end
    resources :subscriptions, only: %i[index]
  end

  get ':id', to: 'mailing_lists#show'

  resources :mailing_lists, path: '', only: :show do
    resources :issues, only: %i[index show]
    resources :subscriptions, only: %i[create]
  end

  resources :links, only: :show

  get :subscribe, to: 'subscriptions#update', path: 'subscriptions/subscribe'
end
