class VolumesController < ApplicationController

  # GET /volumes
  def index
    # TODO: There must be a better way to ensure that @page is 1 or greater.
    @page = params[:page].to_i if params.has_key?(:page)
    @page = 1 if @page.nil? || @page < 1
    @volumes = GoogleBooks.search('ruby on rails', {:count=>10,:page=>@page})
    # Pagination
    @total_items = @volumes.total_items
    page_size = 10.0 # ensure floating point division when calculating page_count
    @page_count = (@total_items / page_size).ceil
  end

end
