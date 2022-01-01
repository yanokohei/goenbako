Rails.application.routes.draw do
  root to: 'home#index'
  get 'mypage', to: 'home#index'

  namespace :api do
    post 'oauth/callback', to: 'oauths#callback'
    get 'oauth/callback', to: 'oauths#callback'
    get 'oauth/:provider', to: 'oauths#oauth', as: :auth_at_provider
    delete 'logout', to: 'user_sessions#destroy'
    get 'random', to: 'visits#random'
    resources :users, param: :twitter_id, only: %i[index edit update show destroy] do
      collection do
        get 'me'
      end
      member do
        get 'sent_letters'
        get 'received_letters'
      end
    end
    resources :letters
    resources :share_images, only: %i[create]
  end

  get '/:twitter_id', to: 'crawlers#show', constraints: { user_agent: /Twitterbot/ }

  get '*path', to: 'home#index'
end
