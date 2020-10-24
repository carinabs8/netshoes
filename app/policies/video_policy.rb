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

  def update
  	user && record.user_id == user.id
  end
end