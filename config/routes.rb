Rails.application.routes.draw do
  root to: "tops#index"
    resource :photos
    resources :apis do
    collection do
      get :op
    end
  end
end
