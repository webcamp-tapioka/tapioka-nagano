class Admin::ArtistsController < ApplicationController

	def index
		@newartist = Artist.new
		@editartist = Artist.new
		@artists = Artist.all
	end

	def edit
		@newartist = Artist.new
		@editartist = Artist.find(params[:id])
		@artists = Artist.all
		render 'index'
	end

	def create
		newartist = Artist.new(artist_params)
		newartist.save
		redirect_to admin_artists_path
	end

	def update
		editartist = Artist.find(params[:id])
		editartist.update(artist_params)
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
