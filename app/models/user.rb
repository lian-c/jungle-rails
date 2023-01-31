class User < ApplicationRecord
  before_validation :lower_case

  has_secure_password #will check password + password confirmation, presence
  validates :password, length: {minimum: 8}
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  
  def self.authenticate_with_credentials(email, password)
    @email = email.downcase.strip
    @user = User.find_by_email(@email)
    if @user && @user.authenticate(password)
      @user
    else 
      nil
    end
  end
end

private

def lower_case
  self.email = email.downcase.strip if email.present?
end

  