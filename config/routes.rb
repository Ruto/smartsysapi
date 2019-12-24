Rails.application.routes.draw do
  #root to: "user_profiles#index"
  devise_for :users
  namespace :v1, defaults: { format: :json } do

    resources :user_profiles
    resources :sessions, only: [:create, :destroy]
    resources :reset_passwords, only: :create
    resources :users, only: :create
    resources :structures
    namespace :structures do
        resources :incomes, :prices, :expenses, :indirect_expenses, :adminstrative_costs, :product_sales,
        :product_expenses, :quantities, :total_sale, :products, :controller => 'structures', :except => [:destroy, :edit, :update ]
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
