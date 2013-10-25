class UserprojectController < ApplicationController
	before_action :set_enduser, only: [:show]
  def index
  	
  end

  def show
  	@projects=Project.all where enduser_id == @enduser
  end
 
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_enduser
      @enduser = Enduser.find(params[:id])
    end
end
