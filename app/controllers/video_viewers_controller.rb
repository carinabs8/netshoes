class VideoViewersController < ApplicationController
	skip_before_action :authenticate_user!

  def create
  	videos = Video.where(id: params[:ids])
  	return if videos.blank?
  	videos.each do |video|
  		video.update_viewers
		end
  end
end
