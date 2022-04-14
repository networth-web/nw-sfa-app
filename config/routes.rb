Rails.application.routes.draw do
  root to: 'home#top'

  devise_for :users, controllers: {
    # registrationsコントローラーを編集できるようにする
    registrations: 'users/registrations'
  }
  devise_scope :user do
    # 管理画面を認識させるため、createはページが存在しないため必要無し
    get 'admin/users/new' => 'users/registrations#new', as: :new_user_admin_registration
    # 管理者用編集パス
    get 'admin/users/:id/edit' => 'users/registrations#edit', as: :edit_other_user_registration
    match 'admin/users/:id', to: 'users/registrations#update', via: [:patch, :put], as: :other_user_registration
  end

  resources :leads do
    collection do
      get 'all_leads'
      get 'my_leads'
      get 'csv'
      post 'csv_import'
    end
    member do
      patch 'update_sales_process'
    end
    resources :activities do
      collection do
        get 'search'
      end
    end
    resources :schedules
    resources :losts
    resources :images
  end

  resources :lead_seminars do
    member do
      patch 'update_attend'
      patch 'update_approval'
      get 'edit_reason'
    end
  end

  resources :activities do
    collection do
      get 'all_meetings'
      get 'my_meetings'
      get 'all_orders'
      get 'my_orders'
    end
  end

  resources :losts do
    collection do
      get 'all_losts'
      get 'my_losts'
    end
  end

  resources :schedules, only: [:index]

  resources :seminars
  resources :sources
  resources :sales_processes
  resources :properties do
    resources :rooms
  end
  resources :losts, only: [:index]
  resources :notifications, only: [:index]
  
  resource :admin, only: [:show] do
    resources :template_models
    resources :hides
    resources :users, :only => [:index, :show]
  end
end

