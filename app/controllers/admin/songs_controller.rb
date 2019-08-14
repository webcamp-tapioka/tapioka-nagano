class Admin::SongsController < ApplicationController




  def create
    song_params[:song].each do |song|
      new_song = Song.new(song)
      new_song.save
    end
    redirect_to new_admin_song_path
  end

  def new

    @new_song = Song.new
    @songs = Song.all
  end

  private



    def product_params
      params.require(:product).permit(:id)
    end

    def song_params
  	  params.permit(song: [:product_id, :song, :track_number,
         :disc_number, :song])
    end


end




