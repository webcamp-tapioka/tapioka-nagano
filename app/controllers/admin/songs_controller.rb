class Admin::SongsController < ApplicationController

  def create
    songs_params[:song].each do |song|
      new_song = Product.last.songs.new(song)
      new_song.save
    end
    redirect_to new_admin_song_path
  end

  def new
    if to_create_form_params[:what_disc_number]
      # @from_what_track_number = to_create_form_params[:from_what_track_number].to_i
      @new_song = Product.last.songs.new(disc_number: to_create_form_params[:what_disc_number].to_i)
      # 何曲から？ではなく全体で何曲かを取得する
      @what_track_number = params[:what_track_number].to_i
    end
      @songs = Product.last.songs.all.order(:disc_number).order(:track_number)
  end



  def destroy
    song = Song.find(params[:id])
    song.destroy
    redirect_to new_admin_song_path
  end

  private

    

    def to_create_form_params
      params.permit(:what_disc_number, :from_what_track_number)
    end

    def songs_params
  	  params.permit(song: [:song, :track_number,
         :disc_number, :song])
    end

    def song_params
      params.require(:song).permit(:song, :track_number, :disc_number)
    end

end




