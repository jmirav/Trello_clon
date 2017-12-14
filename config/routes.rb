Rails.application.routes.draw do


  scope "(:locale)", locale: /es|en/ do
    namespace :api, defaults: { format: :json } do
      namespace :v1 do
        resources :boards do
          resources :lists do
            resources :tasks
          end
        end
      end
    end
  end
end
