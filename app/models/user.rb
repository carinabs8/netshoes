class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable#, authentication_keys: [:login]

  validates :email, presence: true, uniqueness: { case_sensitive: false }

  validates :role, presence: true
  validates :role, inclusion: {in: ProfileEnum.values}

  def admin?
    role.to_sym == ProfileEnum::ADMIN
  end
end
