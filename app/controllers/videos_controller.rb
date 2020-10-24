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
		@video = Video.new(videos_params)
		authorize @video

		if @video.save
			redirect_to videos_path, notice: "Successfully created"
		else
			render :new
		end
	end

	protected
	def videos_params
		params.require(:video).permit(:name, :url)
	end
end
