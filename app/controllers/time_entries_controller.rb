class TimeEntriesController < ApplicationController
  def index
    @time_entries = TimeEntry.all
  end
  
  def show
    @time_entry = TimeEntry.find(params[:id])
  end

  def new
    @time_entry = TimeEntry.new
  end
 
  def edit
    @time_entry = TimeEntry.find(params[:id])
  end

  def create
    @time_entry = TimeEntry.new(time_entry_params)
    respond_to do |format|
      if @time_entry.save
        format.json {render json: {status: :success, data: @time_entry}}
      else
        format.json {render json: {status: :error, data: @time_entry.errors}}
      end
    end
  end

  def update
    @time_entry = TimeEntry.find(params[:id])
    respond_to do |format|
      if @time_entry.update(time_entry_params)
        format.json {render json: {status: :ok, data: @time_entry}}
      else
        format.json {render json: {status: :error, data: @time_entry.errors}}
      end
    end
  end
  
  def destroy
    @time_entry = TimeEntry.find(params[:id])
    respond_to do |format|
      if @time_entry.destroy
        format.json {render json: {status: :delete}}
    end
  end

  private

  def project_params
    params.require(:time_entry).permit(:date, :mentor_id, :task, :hours, :is_billable)
  end

end
