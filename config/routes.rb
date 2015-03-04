Rails.application.routes.draw do

  root :to => 'pages#index'

  get '/uhoh' => 'pages#redirect'

  get '/index' => 'pages#index'
  get '/gridcode' => 'pages#gridcode'

  resources :users, :activities

  resources :meals do
    resources :foods
  end

  resources :bloodsugars, only: [:index] do
    collection { post :import }
  end

  get '/dashboard' => 'users#dashboard'
  get '/weather' => 'pages#weather'
  get '/readingdata/bslevel' => 'users#bslevel'
  get '/readingdata' => 'bloodsugars#data'
  get '/readingdata/readingtime' => 'users#readingtime'
  get '/readingdata/bslevel_lastthirty' => 'users#bslevel_lastthirty'
  get '/readingdata/readingtime_lastthirty' => 'users#readingtime_lastthirty'
  get '/readingdata/foods' => 'foods#index'
  get '/readingdata/carbs' => 'foods#carbs'
  get '/readingdata/mealtime' => 'foods#mealtime'
  get '/readingdata/carbs_lastthirty' => 'foods#carbs_lastthirty'
  get '/readingdata/mealtime_lastthirty' => 'foods#mealtime_lastthirty'

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  post '/whatever' => "foods#test"

  get '/singlecalculation' => 'pages#calc'

  get '/testing' => 'pages#testing'
end
