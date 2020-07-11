Rails.application.routes.draw do
  resources :recordings
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "recordings#index"
end
