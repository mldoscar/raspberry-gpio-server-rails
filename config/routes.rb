Rails.application.routes.draw do
  get 'home/index'

  root to: 'home#index'

  # For the moment only BOARD mode is available, that's why we disable this
  # post '/gpio/mode', to: 'home#set_mode', as: 'gpio_set_mode'
  post '/gpio/pins', to: 'home#set_input_pin', as: 'gpio_set_input_pin'
  post '/gpio/hard_reset', to: 'home#hard_reset', as: 'gpio_hard_reset'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
