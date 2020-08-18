Rails.application.routes.draw do
  resources :projects, only: [:create, :new]

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
    get 'landing' => :landing
    post 'landing' => :new_lead
  end
  
  root 'sessions#landing'
end
