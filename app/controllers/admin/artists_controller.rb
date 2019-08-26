
class Admin::ArtistsController < Admin::ApplicationController

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
		Artist.create!(artist_params)
		redirect_to admin_artists_path
	end

	def update
		Artist.find(params[:id]).update!(artist_params)
		redirect_to admin_artists_path
	end

	def destroy
		Artist.find(params[:id]).destroy
    redirect_to admin_artists_path
	end
	


	private

	def artist_params
		params.require(:artist).permit(:name)
	end

end
