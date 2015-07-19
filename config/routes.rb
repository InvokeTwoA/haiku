Rails.application.routes.draw do
  root to: "words#index"
  resources :words, excepts: [:index]

  resources :goods do
    collection do
      get "yes/:id" => "goods#yes"
    end
  end

  namespace 'admin' do
    resources :words
    resources :goods
  end

end
