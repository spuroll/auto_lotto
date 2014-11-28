Rails.application.routes.draw do

  get 'number_set/index'

  get 'number_set/show'

  get 'number_set/new'

  get 'number_set/edit'

  get 'number_set/delete'

  root "application#hello"

  match ':controller(/:action(/:id))', :via => [:get, :post]


end
