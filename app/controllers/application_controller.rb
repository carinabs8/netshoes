class ApplicationController < ActionController::Base
	include Pundit
	before_action :authenticate_user!

	rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

	def user_not_authorized
    flash_not_authorized
    redirect_to(videos_path)
  end

  def flash_not_authorized
    flash[:danger] = "You are not authorize into this page."
  end
end
