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

      resources :mailing_lists, path: '', only: %i[show] do
        resources :issues, only: %i[index show]
      end

      resources :subscriptions, only: %i[create]

      resources :links, only: %i[show]

      namespace :dashboard do
        resources :mailing_lists, except: %i[edit new] do
          resources :subscriptions, only: %i[index]
        end
      end

      get :subscribe, to: 'subscriptions#update', path: 'subscriptions/subscribe'
    end
  end
end
