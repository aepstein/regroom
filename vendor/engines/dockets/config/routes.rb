Refinery::Application.routes.draw do
  resources :dockets, :only => [:index, :show]
  resources :docket_perspectives, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :dockets, :except => :show do
      collection do
        post :update_positions
      end
    end
    resources :docket_perspectives, :except => :show
  end
end

