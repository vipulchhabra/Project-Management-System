class MainadminController < ApplicationController
  layout :action

	def index 
	end

	def faqs
	end

	def news
	end
	
	def contactus
	end

	private
	 def action
      if current_user.role == "admin"
        "application"
      else
        "special"
      end
     end
end
