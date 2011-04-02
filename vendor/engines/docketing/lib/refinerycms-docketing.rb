require 'refinerycms-base'

module Refinery
  module Docketing
    class Engine < Rails::Engine
      initializer "static assets" do |app|
        app.middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public"
      end

      config.after_initialize do
        Refinery::Plugin.register do |plugin|
          plugin.name = "docketing"
          plugin.url = { :controller => 'admin/dockets', :action => 'index' }
          plugin.activity = {
            :class => Docket,
            :title => 'name'
          }
        end
      end
    end
  end
end

