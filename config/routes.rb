Rails.application.routes.draw do
  scope "(:locale)", locale: /es|en/ do
    namespace :api, defaults: { format: :json } do
      namespace :v1 do
        resources :boards
      end
    end
  end
end
