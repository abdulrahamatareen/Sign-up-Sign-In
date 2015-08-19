class UsersController < ApplicationController
 
before_save :encrypt_password 
after_save :clear_password   

end
def new
      @user = User.new
  end
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "You signed up successfully"
      flash[:color]= "valid"
    else
      flash[:notice] = "Form is invalid"
      flash[:color]= "invalid"
    end
    render "new"
 end
def self.authenticate
(username_or_email="", login_password="") 
if EMAIL_REGEX.match(username_or_email) user = User.find_by_email(username_or_email) 
else user = User.find_by_username(username_or_email) 
end
 if user && user.match_password(login_password) 
return user 
else return false 
end 
end 
def match_password(login_password="")
 encrypted_password == BCrypt::Engine.hash_secret(login_password, salt) 
end 
end
