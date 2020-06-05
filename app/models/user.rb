class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #  :jwt_authenticatable, jwt_revocation_strategy: Denylist
  has_many :posts, foreign_key: "user_id"
end
