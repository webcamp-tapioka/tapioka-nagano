<<<<<<< HEAD
class Admin::GenresController < ApplicationController
=======
class Admin::GenresController < Admin::ApplicationController
>>>>>>> origin/master
def index
		@new_genre = Genre.new
		@genres = Genre.all
	end

	def edit
		@new_genre = Genre.new
		@edit_genre = Genre.find(params[:id])
		@genres = Genre.all
		render 'index'
	end

	def create
		Genre.create!(genre_params)
		redirect_to admin_genres_path
	end

	def update
		Genre.find(params[:id]).update!(genre_params)
		redirect_to admin_genres_path
	end

	def destroy
		Genre.find(params[:id]).destroy
        redirect_to admin_genres_path
	end
	


	private

	def genre_params
		params.require(:genre).permit(:name)
	end

end
