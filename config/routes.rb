Rails.application.routes.draw do
  resources :lists do
    resources :todos do

    end
  end
  
  root "lists#index"

end
