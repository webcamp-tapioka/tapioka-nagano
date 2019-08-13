class Admin::SongsController < ApplicationController

  def create
  	new_songs = Song.new(songs_params)
  	new_one_song =new_songs[0]
  	new_one_song.save


  end

  def new
  	@to_register = Song.new
    @new_song = Song.new
  end


  def to_register
  	@create_form = Song.new(song_params)
  	@to_register = Song.new(song_params)
  	@new_song = Song.new
  	render 'new'
  end



  private

    def song_params
  	  params.require(:song).permit(:product_id, :song, :track_number, :disc_number)
    end

    def songs_params
      params.require(:songs).map { |song| song.permit(:product_id, :song, :track_number, :disc_number) }
    end

end
