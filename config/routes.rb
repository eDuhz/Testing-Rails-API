Rails.application.routes.draw do
  resources :add_kind_to_comboboxes
  resources :kinds
  resources :comboboxes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
