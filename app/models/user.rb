class User < ActiveRecord::Base

    attr_accessor :password
  EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i
  validates :username, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
  validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
  validates :password, :confirmation => true #password_confirmation attr
  validates_length_of :password, :in => 6..20, :only => :create
  before_filter :save_login_state, :only => [:new, :create]
def encrypt_password 
unless password.blank? 
self.salt = BCrypt::Engine.generate_salt 
self.encrypted_password= BCrypt::Engine.hash_secret(password, salt)
 end 
end 
def clear_password self.password = Nil 
end  
end
