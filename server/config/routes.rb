Rails.application.routes.draw do
  scope(path: '/api') do
    resources :companies, :only => [:index, :show], constraints: {:id => /\d+|[A-Z\^]+/i}, defaults: {format: 'json'}
  end
end
