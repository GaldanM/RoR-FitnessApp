Rails.application.routes.draw do
  root 'static_pages#home'

  get 'admin_login' => 'sessions#new'
  post 'admin_login' => 'sessions#create'
  get 'admin_logout' => 'sessions#delete'

  resources :courses

  get 'courses/:id_course/bookings' => 'sessions#new'
  post 'courses/:id_course/bookings' => 'sessions#create'
  delete 'courses/:id_course/bookings/:id_booking' => 'sessions#delete'

  resources :memberships, except: :show

  resources :messages, except: [:new, :update, :edit]
  get 'contact' => 'messages#new'

  resources :custom_pages, except :index
  
end
