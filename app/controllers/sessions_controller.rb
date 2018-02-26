class SessionsController < ApplicationController

  def new
  end

  def destroy
    log_out
    flash[:success] = "You are logged out"
    redirect_to root_path
  end

  def create
    user = User.find_by name: params[:session][:name].downcase
     @url =params[:url]
        logger.debug "URL #{@url}"
    if user && user.authenticate(params[:session][:password])
      #TODO save user infor into session
      flash[:success] = "Login success"
      log_in user
      logger.debug session
      if params[:url].nil? 
        # @url =params[:url]
        # logger.debug "URL #{@url}"
        redirect_to '/home'
      else
        # @url =params[:url]
        # logger.debug "URL #{@url}"
        redirect_to @url
      end
      
    else
      flash[:danger] = "Invalid email/password combination"
      render :new
    end
  end
end
