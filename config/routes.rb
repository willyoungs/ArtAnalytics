Rails.application.routes.draw do
  resources :pieces
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pieces#home'
  get '/' => 'pieces#home'
  post '/' => 'pieces#home'
  get 'search' => 'pieces#search'
  post 'search' => 'pieces#search'
  get 'avg_price_by_artist' => 'pieces#avg_price_by_artist'
  post 'avg_price_by_artist' => 'pieces#avg_price_by_artist'
  get 'price_by_birthdate_deathdate' => 'pieces#price_by_birthdate_deathdate'
  post 'price_by_birthdate_deathdate' => 'pieces#price_by_birthdate_deathdate'
end
