class Admin::SongsController < ApplicationController
  
  def create
    songs_params[:song].each do |song|
      Product.find(params[:product_id]).songs.create(song)
    end
    redirect_to admin_product_songs_path(product_id: params[:product_id])
  end

  def new
      @what_track_number = params[:what_track_number].to_i
      @new_song = Product.find(params[:product_id]).songs.new(disc_number: params[:what_disc_number].to_i)
      @songs = Product.find(params[:product_id]).songs.all.order(:disc_number).order(:track_number)
      render 'index'
  end

  def edit
    @edit_song = Product.find(params[:product_id]).songs.find(params[:id])
    @songs = Product.find(params[:product_id]).songs.all.order(:disc_number).order(:track_number)
    render 'index'
  end

  def index
    @songs = Product.find(params[:product_id]).songs.all.order(:disc_number).order(:track_number)
  end

  def update
    edit_song = Product.find(params[:product_id]).songs.find(params[:id])
    edit_song.update(song_params)
    if Product.find(params[:product_id]).songs.where(disc_number: edit_song.disc_number, track_number: edit_song.track_number).count >= 2
      Product.find(params[:product_id]).songs.where(disc_number: edit_song.disc_number).where('track_number >= ?', edit_song.track_number).
      where.not(id: edit_song.id).update_all('track_number = track_number + 1')
    end
    redirect_to admin_product_songs_path(params[:product_id])
  end

  def destroy
    Product.find(params[:product_id]).songs.find(params[:id]).destroy
    redirect_to admin_product_songs_path(params[:product_id])
  end



  private

    def songs_params
  	  params.permit(song: [:song, :track_number, :disc_number])
    end

    def song_params
      params.require(:song).permit(:song, :track_number, :disc_number)
    end

end
