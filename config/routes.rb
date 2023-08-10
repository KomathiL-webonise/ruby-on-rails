Rails.application.routes.draw do
  root "posts#index"

  resources :posts do
    member do
      put :publish
      put :unpublish
    end
  end
end