class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authenticate_user!
  #before_filter :is_admin
   #before_action :login_redirect  

   #def login_redirect
   # if user_signed_in? && current_user.role == "admin"
   #   mainadmin_index_path 
   # else
   # end
   #end


  #def is_admin
  # if user_signed_in?
  #  if current_user.role == admin?
   #   redirect_to mainindex_index_path
   # else
   #   redirect_to home_index_path
   # end
   #end
  #end
  
  private
    def current_enduser
     Enduser.find(session[:enduser_id])
     rescue ActiveRecord::RecordNotFound
     enduser = Enduser.create
     session[:enduser_id] = enduser.id
     enduser
    end

end
