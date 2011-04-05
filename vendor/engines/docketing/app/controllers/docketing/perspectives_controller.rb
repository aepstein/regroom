module Docketing
  class PerspectivesController < DocketingController

    before_filter :find_all_docketing_perspectives

    def index
      # you can use meta fields from your model instead (e.g. browser_title)
      # by swapping @page for @docket_perspective in the line below:
      present(@page)
    end

    def show
      @docketing_perspective = DocketingPerspective.find(params[:id])

      # you can use meta fields from your model instead (e.g. browser_title)
      # by swapping @page for @docket_perspective in the line below:
      present(@page)
    end

  protected

    def find_all_docketing_perspectives
      @docketing_perspectives = DocketingPerspective.scoped
    end

  end
end

