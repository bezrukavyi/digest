Rails.application.routes.draw do
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: '/letter_opener'
  end

  get ':id', to: 'mailing_lists#show'

  resources :mailing_lists, path: '', only: :show do
    resources :issues, only: %i[index show]
    resources :subscriptions, only: %i[new create]
  end

  get :subscription_confirmation, to: 'subscriptions#subscribe', path: 'subscriptions/confirmation'
end
