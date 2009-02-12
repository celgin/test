# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '9f179fee511d44a0baadde4749654aeb'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password
  before_filter :fetch_logged_in_user
  

  attr_accessor :current_user
  helper_method :current_user
  helper_method :me?
  helper_method :home_or_root_path
  layout 'application'
  
  
  protected
  
    def fetch_logged_in_user
      return unless session[:user_id]
      @current_user = User.find_by_id(session[:user_id])
      #logger.info "#{@current_user.username} requested.request_uri} on #{Time.now}"
    end
    
    def home_or_root_path
      current_user ? home_path : root_path
    end
    
    #def logged_in?
    #  ! @current_user.nil?
    #end
    #helper_method :logged_in?



    #def login_required
    #  return true if  logged_in?
    #  session[:return_to] = request.request_uri
    #  redirect_to new_session_path and return false
    #end



    def home_or_root_path
      current_user ? home_path : root_path
    end

    def me?
      !@user || @user.id == current_user.id
    end


end
