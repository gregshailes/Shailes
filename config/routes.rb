Rails.application.routes.draw do

  devise_for :users

  root to: 'homepage#index'

  get 'home', to: 'homepage#personal_menu'
  get 'work', to: 'homepage#work_menu'
  get 'finances', to: 'finances/accounts#index'
  get 'diary', to: 'diary/entries#index'

  get 'background/:for', to: 'backgrounds#random'

  namespace :finances do
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

  namespace :diary do
    resources :entries
  end

end
