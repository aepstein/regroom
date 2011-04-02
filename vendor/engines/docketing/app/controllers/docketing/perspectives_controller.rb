module Docketing
  class PerspectivesController < ApplicationController

    before_filter :find_all_perspectives
    before_filter :find_page

    def index
      # you can use meta fields from your model instead (e.g. browser_title)
      # by swapping @page for @docket_perspective in the line below:
      present(@page)
    end

    def show
      @perspective = DocketPerspective.find(params[:id])

      # you can use meta fields from your model instead (e.g. browser_title)
      # by swapping @page for @docket_perspective in the line below:
      present(@page)
    end

  protected

    def find_all_perspectives
      @perspectives = DocketPerspective.scoped
    end

    def find_page
      @page = Page.where(:link_url => "/docket_perspectives").first
    end

  end
end

