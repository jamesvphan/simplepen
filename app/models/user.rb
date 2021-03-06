class User < ApplicationRecord
  has_many :notebooks
  has_many :notes, through: :notebooks
  validates :username, presence: true
  has_secure_password

  def self.authenticated(username, password)
    user = User.find_by(username: username)
    user && user.authenticate(password)
  end

  def self.from_token(token)
    user_id = Auth.decode(token)["user_id"]
    User.find(user_id)
  end
end
