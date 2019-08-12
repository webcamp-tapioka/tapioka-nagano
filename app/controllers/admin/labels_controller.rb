class Admin::LabelsController < ApplicationController


	def index
		@newlabel = Label.new
		@editlabel = Label.new
		@labels = Label.all
	end

	def edit
		@newlabel = Label.new
		@editlabel = Label.find(params[:id])
		@labels = Label.all
		render 'index'
	end

	def create
		newlabel = Label.new(label_params)
		newlabel.save
		redirect_to admin_labels_path
	end

	def update
		editlabel = Label.find(params[:id])
		editlabel.update(label_params)
		redirect_to admin_labels_path
	end

	def destroy
		label = Label.find(params[:id])
		label.destroy
		redirect_to admin_labels_path
	end



	private

	def label_params
		params.require(:label).permit(:name)
	end

end
