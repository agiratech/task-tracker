class ProjectsController < ApplicationController
  before_action :authenticate_current_user
  def index
    @projects = Project.all
    respond_to do |format|
      format.json { render json: @projects }
    end
  end
  
  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end
 
  def edit
    @project = Project.find(params[:id])
  end

  def create
    @project = Project.new(project_params)
    if @current_user.present? && @current_user.role_type == "admin"
      respond_to do |format|
          if @project.save
            format.json {render json: {status: :success, data: @project}}
          else
            format.json {render json: {status: :error, data: @project.errors}}
          end
        end
    end
  end

  def update
    @project = Project.find(params[:id])
    respond_to do |format|
      if @project.update(project_params)
        format.json {render json: {status: :ok, data: @project}}
      else
        format.json {render json: {status: :error, data: @project.errors}}
      end
    end
  end
  
  def destroy
    @project = Project.find(params[:id])
    respond_to do |format|
      if @project.destroy
        format.json {render json: {status: :delete}}
      end
    end
  end

  private

  def project_params
    params.require(:project).permit(:name, :project_type, :start_date, :end_date, :hours, :is_billable)
  end
end