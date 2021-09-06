Rails.application.routes.draw do

  devise_for :users

  root to: 'homepage#index'

  get 'home', to: 'homepage#personal_menu'
  get 'work', to: 'homepage#work_menu'

  get 'background/:for', to: 'backgrounds#random'

  get 'decision', to: 'decisions#new'

  namespace :finances do
    root to: 'finances/accounts#index'
    resources :accounts do
      resources :transactions do
        collection do
          get 'export', format: [:csv]
        end
      end
      resources :bills do
        get 'record_payment', to: 'bills#record_payment'
      end
      resource :transfer, only: [:new, :create]
    end
  end

  resources :tasks, only: [:index, :new, :create] do
    get :start_work
    get :stop_work
    get :complete
    collection do
      get :archive
    end
  end

  namespace :edit_menus do
    root to: 'areas#index'
    resources :areas do
      resources :menus do
        resources :menu_items
      end
    end
  end

  namespace :diary do
    root to: 'entries#index'
    resources :entries
  end

end
