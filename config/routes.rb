Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#index"
    namespace :admin do
      root "admin#index"
      get "/login", to: "session#new"
      resources :admin_customers
      resources :departments
      resources :dish_types
      resources :dishes
    end
    get "/account_activations/:id/edit", to: "account_activations#edit", as: "edit_account_activation"
    resources :users
  end
end
