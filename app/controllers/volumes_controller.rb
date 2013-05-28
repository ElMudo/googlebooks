class VolumesController < ApplicationController
  # GET /volumes
  def index
    @volumes = GoogleBooks.search('ruby on rails', {:count=>10,:page=>1})
    @total_items = @volumes.total_items
  end

  # GET /volumes/1
  # GET /volumes/1.json
  def show
    @volume = Volume.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @volume }
    end
  end

end
