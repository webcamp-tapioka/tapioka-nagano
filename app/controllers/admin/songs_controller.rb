class Admin::SongsController < ApplicationController
  
  def create
    songs_params[:song].each do |song|
      new_song = Product.last.songs.new(song)
      new_song.save
    end
    redirect_to admin_songs_path
  end

  def new
      @what_track_number = to_create_form_params[:what_track_number].to_i
      @new_song = Product.last.songs.new(disc_number: to_create_form_params[:what_disc_number].to_i)
      @songs = Product.last.songs.all.order(:disc_number).order(:track_number)
      render 'index'
  end


  def edit
    @edit_song = Product.last.songs.find(params[:id])
    @songs = Product.last.songs.all.order(:disc_number).order(:track_number)
    render 'index'
  end


  def index
    @songs = Product.last.songs.all.order(:disc_number).order(:track_number)
  end


  def update
    edit_song = Product.last.songs.find(params[:id])
    edit_song.update(song_params)
      redirect_to admin_songs_path
  end






  def destroy
    song = Song.find(params[:id])
    song.destroy
    redirect_to new_admin_song_path
  end

  private

    

    def to_create_form_params
      params.permit(:what_disc_number, :what_track_number)
    end

    def songs_params
  	  params.permit(song: [:song, :track_number, :disc_number, :song])
    end

    def song_params
      params.require(:song).permit(:song, :track_number, :disc_number)
    end

end