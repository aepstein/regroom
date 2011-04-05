class DocketingController < ApplicationController

  before_filter :find_page

  protected

  def find_page
    @page = Page.find_by_link_url("/docketing")
  end

end

