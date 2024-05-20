Rails.application.routes.draw do
  get 'classes/index'
  get 'classes/show'
  get 'stamps/index'
    devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

    authenticated :user do
        root to: 'home#index',        as: :authenticated_root
    end

    unauthenticated do
        root to: 'static_pages#home', as: :unauthenticated_root
    end

    resources :diaries, only: [:new, :create, :index, :show] do
        collection do
            get 'choose_diary', to: 'diaries#choose_diary'
        end
    end

    resources :stamps, only: [:show]


    get     'users/additional_info',        to: 'users#additional_info',        as: 'additional_info'
    patch   'users/save_additional_info',   to: 'users#save_additional_info',   as: 'save_additional_info'

    get 'classes',                          to: 'classes#index',                as: 'classes'
    get 'classes/:id',                      to: 'classes#show',                 as: 'class_diaries'
end
