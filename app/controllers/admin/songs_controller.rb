class Admin::SongsController < ApplicationController
 

  def create
  end

  def new
  	@to_register = Song.new
    @newsong = Song.new
    if song_params
    	@to_create_form = Song.new(params[:id])
    end
  end




  private
    def song_params
  	  params.require(:song).permit(:product_id, :song, :track_number, :disc_number)
  	end
end
