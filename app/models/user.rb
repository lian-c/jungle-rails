class User < ApplicationRecord
  before_validation :lower_case

  has_secure_password #will check password + password confirmation, presence
  validates :password, length: {minimum: 8}
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

end


private

def lower_case
  self.email = email.downcase.strip if email.present?
end