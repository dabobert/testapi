TalentTracker::Application.routes.draw do
  resources :api
  resources :debug
  root :to => 'api#show'
end