class User < ActiveRecord::Base
  include BCrypt
  has_many :user_answers
  has_many :surveys

#CR add validations

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
