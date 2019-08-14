class Admin::SongsController < ApplicationController


{"disc_number"=>"1", "track_number"=>"", "product_id"=>"", "song"=>""}
{"disc_number"=>"1", "track_number"=>"", "product_id"=>"", "song"=>""}

{"name"=>"となかい", "gender"=>"女性:"}




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




