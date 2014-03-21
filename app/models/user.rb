class User < ActiveRecord::Base
  has_many :comments
  has_many :posts
  include BCrypt

  def self.create(params)
    @user = self.new(params)
    @user.password = params[:password_hash]
    @user.save!
    @user
  end

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password) #encrypts the new password
    @password = Password.create(new_password)
    self.password_hash = @password
  end

end
