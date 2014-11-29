Rails.application.routes.draw do

  get 'number_set/index'

  get 'number_set/show'

  get 'number_set/edit'

  get 'number_set/delete'

  get    'index' => 'number_set#index'
  get    'new'   => 'number_set#new'
  post   'new'   => 'number_set#create'

  match ':controller(/:action(/:id))', :via => [:get, :post]


end
