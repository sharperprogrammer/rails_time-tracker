Rails.application.routes.draw do
  root 'pages#home'
  resources :time_items
  post 'radarada', to: 'time_items#start'
  post 'radaradarada', to: 'time_items#stop'
end
