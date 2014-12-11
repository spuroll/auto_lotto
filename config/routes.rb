Rails.application.routes.draw do

  root 'number_set#index'
  match ':controller(/:action(/:id))', :via => [:get, :post]


end
