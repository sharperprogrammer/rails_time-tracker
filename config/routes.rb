Rails.application.routes.draw do
  root 'pages#home'
  resources :time_items
  post 'radarada', to: 'time_items#start'
  post 'radaradarada', to: 'time_items#stop'
  get 'radaradaradarada', to: 'time_items#get_current_time'
end
