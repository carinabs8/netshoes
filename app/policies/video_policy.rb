class VideoPolicy < ApplicationPolicy

  def create?
  	new?
  end

  def new?
    user && user.admin?
  end

  def index?
  	true
  end
end