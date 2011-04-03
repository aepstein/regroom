module Docketing
  class DocketsController < ApplicationController

    before_filter :find_all_dockets
    before_filter :find_page

    def index
      # you can use meta fields from your model instead (e.g. browser_title)
      # by swapping @page for @docket in the line below:
      present(@page)
    end

    def show
      @docket = Docket.find(params[:id])

      # you can use meta fields from your model instead (e.g. browser_title)
      # by swapping @page for @docket in the line below:
      present(@page)
    end

  protected

    def find_all_dockets
      @dockets = Docket.order('position ASC')
    end

    def find_page
      @page = Page.where(:link_url => "/dockets").first
    end

  end
end

