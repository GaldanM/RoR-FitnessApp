Rails.application.routes.draw do
  root 'static_pages#home'

  get 'admin_login' => 'sessions#new'
  post 'admin_login' => 'sessions#create'
  get 'admin_logout' => 'sessions#delete'

  resources :courses

  resources :courses do
    resources :bookings, except: [:index, :show]
  end

  resources :memberships, except: :show

  resources :messages, except: [:new, :update, :edit]
  get 'contact' => 'messages#new'

  resources :images

  resources :custom_pages, except: :index
  
end
