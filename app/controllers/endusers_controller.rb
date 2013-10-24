class EndusersController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_enduser, only: [:show, :edit, :update, :destroy, :assign]
  helper_method :sort_column, :sort_direction
  layout :action

  
  # GET /endusers
  # GET /endusers.json
  def index
    @pro=params[:project_id]
    tempa= EndusersProject.where(project_id: params[:project_id]).pluck(:enduser_id) 
    @endusers = Enduser.where("id != ?", params[:enduser_id]) unless (params[:search] == nil)
    #@endusers = Enduser.all unless (params[:search] == nil )
    @endusers = Enduser.search(params[:search]).order(sort_column + ' ' + sort_direction).paginate(:per_page => 5, :page => params[:page])
  end

  def userindex
    @endusers = Enduser.all unless (params[:search] == nil )
    @endusers = Enduser.search(params[:search]).order(sort_column + ' ' + sort_direction).paginate(:per_page => 5, :page => params[:page])
  end
  # GET /endusers/1
  # GET /endusers/1.json
  def userslist  
    @endusers = Enduser.all 
  end            
   #users can see the user list here
   # @endusersproject = Endusers_project.all where endusers_id==1
   # @project.id =Endusers_project.pluck(:id)
   # @projects = Project.all unless (params[:search] == nil ) 
  

  def projectlistperuser     # to see the project assigned per user
    flash[:notice] = "User's profile ::::"
    @enduser=Enduser.where(id: params[:enduser_id]).first
    temp=EndusersProject.where(enduser_id: params[:enduser_id]).pluck(:project_id)
    @projects = Project.where(id: temp)
  end

  def show
  end
 
  def assign
    @enduser.endusers_projects.create(project_id: params[:project_id]).save
    flash[:notice] = "Project assigned successfully"
  end

  # GET /endusers/new
  def new
    @enduser = Enduser.new
  end

  # GET /endusers/1/edit
  def edit
  end

  # POST /endusers
  # POST /endusers.json
  def create
    @enduser = Enduser.new(enduser_params)

    respond_to do |format|
      if @enduser.save
        format.html { redirect_to @enduser, notice: 'Enduser was successfully created.' }
        format.json { render action: 'show', status: :created, location: @enduser }
      else
        format.html { render action: 'new' }
        format.json { render json: @enduser.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /endusers/1
  # PATCH/PUT /endusers/1.json
  def update
    respond_to do |format|
      if @enduser.update(enduser_params)
        format.html { redirect_to @enduser, notice: 'Enduser was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @enduser.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /endusers/1
  # DELETE /endusers/1.json
  def destroy
    @enduser.destroy
    respond_to do |format|
    format.html { redirect_to endusers_url }
    format.json { head :no_content }
    end
  end

  


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_enduser
      @enduser = Enduser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def enduser_params
      params.require(:enduser).permit(:firstname, :lastname, :empno, :dateofbirth, :address, :photo)
    end


    def action
      if current_user.role == "admin"
        "application"
      else
        "special"
      end
    end

    def sort_column
      Enduser.column_names.include?(params[:sort]) ? params[:sort] : "Firstname"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
