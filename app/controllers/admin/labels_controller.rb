class Admin::LabelsController < ApplicationController

	def index
		@new_label = Label.new
		@labels = Label.all
	end

	def edit
		@new_label = Label.new
		@edit_label = Label.find(params[:id])
		@labels = Label.all
		render 'index'
	end

	def create
		Label.create(label_params)
		redirect_to admin_labels_path
	end

	def update
		 Label.find(params[:id]).update(label_params)
		redirect_to admin_labels_path
	end

	def destroy
		Label.find(params[:id]).destroy
		redirect_to admin_labels_path
	end



	private

	def label_params
		params.require(:label).permit(:name)
	end

end
