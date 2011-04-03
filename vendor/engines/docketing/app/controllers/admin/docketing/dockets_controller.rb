module Admin
  module Docketing
    class DocketsController < Admin::BaseController

      crudify :docket, :searchable => true,
              :title_attribute => 'name', :xhr_paging => true

    end
  end
end

