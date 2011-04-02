module Admin
  module Dockets
    class DocketsController < Admin::BaseController

      crudify :docket,
              :title_attribute => 'name', :xhr_paging => true

    end
  end
end

