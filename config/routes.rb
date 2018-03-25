Rails.application.routes.draw do
  if Rails.env.development? # rubocop:disable Style/IfUnlessModifier
    mount LetterOpenerWeb::Engine, at: '/letter_opener'
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: :auth, controllers: {
        token_validations:  'api/v1/overrides/token_validations',
        registrations:      'api/v1/overrides/registrations',
        sessions:           'api/v1/overrides/sessions',
        omniauth_callbacks: 'api/v1/overrides/omniauth_callbacks',
        passwords:          'api/v1/overrides/passwords'
      }

      namespace :dashboard do
        resources :mailing_lists do
          resources :subscriptions, only: %i[index]
          resources :issues, only: %i[index]
        end
        resources :subscriptions, only: %i[index]
      end
    end
  end

  get ':id', to: 'mailing_lists#show'

  resources :mailing_lists, path: '', only: :show do
    resources :issues, only: %i[index show]
    resources :subscriptions, only: %i[create]
  end

  resources :links, only: :show

  get :subscribe, to: 'subscriptions#update', path: 'subscriptions/subscribe'
end
