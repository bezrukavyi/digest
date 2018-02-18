Rails.application.routes.draw do
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: '/letter_opener'
  end

  namespace :dashboard do
    resources :mailing_lists
  end

  get ':id', to: 'mailing_lists#show'

  resources :mailing_lists, path: '', only: :show do
    resources :issues, only: %i[index show]
    resources :subscriptions, only: %i[create]
  end

  resources :links, only: :show

  get :subscribe, to: 'subscriptions#update', path: 'subscriptions/subscribe'
end
