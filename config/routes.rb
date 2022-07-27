Rails.application.routes.draw do
  root 'flights#index'
  resources :airports
  resources :passenger_details
  resources :bookings
  resources :flight_schedules
  resources :flights
  get "/cancle_booking/:id" => "bookings#cancle_booking", :via => :post, :as => :cancle_booking

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
