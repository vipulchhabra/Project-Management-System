class ProjectsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction

  # GET /projects
  # GET /projects.json
  def index
    #@projects = Project.order(sort_column + ' ' + sort_direction).paginate(:per_page => 5, :page => params[:page])
    @projects = Project.all unless (params[:search] == nil )
    @projects = Project.search(params[:search]).order(sort_column + ' ' + sort_direction).paginate(:per_page => 5, :page => params[:page])#unless (params[:search] == nil )
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
  end

  def home
  end

 
  #def search
   # @projects = Project.search params[:search]
  #end 
  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render action: 'show', status: :created, location: @project }
      else
        format.html { render action: 'new' }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
    format.html { redirect_to projects_url }
    format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_project
    @project = Project.find(params[:id])
  end

    # Never trust parameters from the scary internet, only allow the white list through.
  def project_params
    params.require(:project).permit(:fieldname, :description, :start_date, :end_date)
  end

  def sort_column
    Project.column_names.include?(params[:sort]) ? params[:sort] : "Fieldname"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
    # Using a private method to encapsulate the permissible parameters is
    # just a good pattern since you'll be able to reuse the same permit
    # list between create and update. Also, you can specialize this method
    # with per-user checking of permissible attributes.
  def person_params
    params.require(:project).permit(:fieldname, :description, :start_date, :end_date)
  end

end
