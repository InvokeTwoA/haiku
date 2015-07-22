Rails.application.routes.draw do
  root to: "top#index"
  resources :words do
    collection do
      get :popular
      get :rnd
    end

  end
  get "haiku/:hash" => "words#haiku"

  get "muri" => "words#muri", as: :muri

  resources :goods do
    collection do
      get "yes/:id" => "goods#yes"
    end
  end
  resources :comments

  namespace 'admin' do
    resources :words
    resources :goods
  end

end
