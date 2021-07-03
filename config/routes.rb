Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :campeones #se accede a la ruta /api/v1/campeones
      # get '/campeones', to: 'campeones#index'
    end
  end
end
