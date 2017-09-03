Rails.application.routes.draw do
  

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  get 'eventsLink/:id' => 'events#show' 

  resources :pages do 
    collection do
      get :contact
      get :term
      get :train 
      get :privacy
    end
  end 
  
end
