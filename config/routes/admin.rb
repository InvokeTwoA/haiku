Rails.application.routes.draw do
  namespace 'admin' do
    resources :words
  end
end
