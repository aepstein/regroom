module Admin
  class DocketPerspectivesController < Admin::BaseController

    crudify :docket_perspective,
            :title_attribute => 'name', :xhr_paging => true

  end
end

