Rails.application.routes.draw do
  get ':id', to: 'mailing_lists#show'
end
