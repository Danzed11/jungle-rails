class User < ActiveRecord::Base
  has_secure_password
  has_many :reviews

  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: { case_sensitive: false } 

end
