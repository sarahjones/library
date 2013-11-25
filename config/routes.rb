Library::Application.routes.draw do
  devise_for :users

  get "books/index"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  
  devise_scope :user do
    get "login",  :to => "devise/sessions#new"
    get "logout", :to => "devise/sessions#destroy"
  end
  

  resources :books do
    collection do
      get :checkout
    end
  end

  root :to => 'books#index'

end
