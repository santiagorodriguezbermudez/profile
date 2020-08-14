Rails.application.routes.draw do
  get 'projects/new'
  get 'projects/create'
  get 'users/new'
  get 'users/show'
  # resources :projects, only: [:create, :new, :index, :show]

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  # resources :users, only: [:show]
  # root '/'
end
