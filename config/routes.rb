Rails.application.routes.draw do

  root 'home#index'

  resources :artists do
    resources :albums, except: [:index, :show] do
      resources :songs, except: [:index, :show] do
      end
    end
  end

  resources :albums, except: [:index, :show]

  resources :songs, except: [:index, :show]
end
