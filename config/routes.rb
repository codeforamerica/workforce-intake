Rails.application.routes.draw do
  get "/", to: "workforce_applications#new"
  resources :workforce_applications
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
