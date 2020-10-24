class VideosController < ApplicationController
	skip_before_action :authenticate_user!, only: :index

	def index
		@videos = Video.order(:name).page(params[:page])
	end

	def new
		@video = Video.new
		authorize @video
	end

	def create
		@video = Video.new(videos_params.merge({user_id: current_user.id}))
		authorize @video

		if @video.save
			redirect_to videos_path, success: "Successfully created"
		else
			render :new
		end
	end

	def edit
		@video = Video.where(id: params[:id]).first
		authorize @video
	end

	def update
		@video = Video.where(id: params[:id]).first
		authorize @video
		@video.attributes = videos_params

		if(@video.save)
			redirect_to videos_path, success: "Successfully updated"
		else
			render :edit
		end
	end

	def destroy
		@video = Video.where(id: params[:id]).first
		authorize @video

		@video.destroy
		redirect_to videos_path({page: params[:page]}), success: "Successfully deleted"
	end

	protected
	def videos_params
		params.require(:video).permit(:name, :url)
	end
end
