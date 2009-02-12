class SessionsController < ApplicationController
  
  
  layout false
  
  def index
  end
  
  def new
  end
  
  def registration
    if request.post? and params[:user]
      @user = User.new(params[:user])
      
      if @user.save
        flash[:notice] = "User created"
        redirect_to :action => "new"
      end
    end
  end
  
  def create
    #user = User.find_by_username(params[:login])
    #@current_user = User.find_by_username_and_password(
    #  params[:login], params[:password])
    
    #if user.valid_password?(params[:password]) 
   
    #if @current_user
    #  session[:user_id] = @current_user.id
    @current_user = User.find_by_username_and_password(
      params[:login], params[:password])
    
    if @current_user
      session[:user_id] = @current_user.id
      redirect_to zones_path
    else
      render :action => 'new'
    end
  end

  def destroy
    session[:user_id] = @current_user = nil
    redirect_to :controller => 'session', :action => 'new'
  end

end
