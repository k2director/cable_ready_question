Rails.application.routes.draw do
  resources :cards, only: %i[index create]
  root 'cards#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
