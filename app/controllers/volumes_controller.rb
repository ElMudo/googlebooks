class VolumesController < ApplicationController

  # GET /volumes
  def index
    # TODO: There must be a better way to ensure that @page is 1 or greater.
    @page = 1
    if params.has_key?(:page)  # avoid a redirect when no page index is given.
      @page = params[:page].to_i 
      if @page.nil? || @page < 1
        flash[:error] = "Invalid page index!"
        redirect_to root_path
      end
    end
    user_ip = request.remote_ip # For use on distributed servers (Heroku)
    @volumes = GoogleBooks.search('ruby on rails', {:count=>10,:page=>@page,:api_key=>'AIzaSyChTXpKH2OtDj-sy2XJCfrwT8YQ559KMAE'}, user_ip)
    unless @volumes.nil?
      # Pagination
      @total_items = @volumes.total_items
      page_size = 10.0 # ensure floating point division when calculating page_count
      @page_count = (@total_items / page_size).ceil
    end
  end

end
