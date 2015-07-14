Rails.application.routes.draw do

  root 'home#index'

  resources :artists do
    resources :albums do
      resources :songs do
      end
    end
  end

end
