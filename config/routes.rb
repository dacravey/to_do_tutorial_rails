Rails.application.routes.draw do
  root :to => 'lists#index'

  resources :lists do
    resources :tasks, :except => [:show, :index]
  end

    match 'tasks/complete' => 'tasks#complete', :via => :post

end
