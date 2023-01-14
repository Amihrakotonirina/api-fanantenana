Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :todos
      resources :membre_fanantenanas
      resources :presences
      resources :reunions
      resources :categorie_reunions
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
