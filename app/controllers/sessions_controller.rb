class SessionsController < ApplicationController

  def new
  end

  def destroy
  	session.delete :user_id
  end

  def create
    user = User.find_by name: params[:session][:name].downcase
    if user && user.authenticate(params[:session][:password])
      #TODO save user infor into session
      flash[:success] = "Login success"
      log_in user
      logger.debug session
      if session[:nexturl].nil?
        redirect_to "/home"
      else
       redirect_to session[:nexturl]
       
     end
   else
    flash[:danger] = "Invalid email/password combination"
    render :new
  end
end
end
