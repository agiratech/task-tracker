class ProjectsController < ApplicationController
  def index
    @projects = Project.all
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
    respond_to do |format|
      if @project.save
        format.json {render json: {status: :success, data: @project}}
      else
        format.json {render json: {status: :error, data: @project.errors}}
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

  private

  def project_params
    params.require(:project).permit(:name, :type, :start_date, :end_date, :hours, :is_billable)
  end

end
