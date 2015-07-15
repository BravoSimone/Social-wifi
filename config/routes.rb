Rails.application.routes.draw do
  root to: 'hotspot#index', via: :get
  get 'auth/facebook', as: "auth_provider"
  get 'auth/facebook/callback', to: 'hotspot#login'
end
