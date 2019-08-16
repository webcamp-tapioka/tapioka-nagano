class Admin::ArtistsController < ApplicationController

	def index
		@new_artist = Artist.new
		@artists = Artist.all
	end

	def edit
		@new_artist = Artist.new
		@edit_artist = Artist.find(params[:id])
		@artists = Artist.all
		render 'index'
	end

	def create
		new_artist = Artist.create!(artist_params)
		redirect_to admin_artists_path
	end

	def update
		edit_artist = Artist.find(params[:id])
		edit_artist.update(artist_params)
		redirect_to admin_artists_path
	end

	def destroy
		artist = Artist.find(params[:id])
    artist.destroy
    redirect_to admin_artists_path
	end



	private

	def artist_params
		params.require(:artist).permit(:name)
	end

end
