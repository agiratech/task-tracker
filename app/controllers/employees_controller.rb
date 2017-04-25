class EmployeesController < ApplicationController
  # skip_before_filter :verify_authenticity_token
  # def index
  #   @employees = Employee.all
  # end
  
  # def show
  #   @employee = Employee.find(params[:id])
  # end

  # def new
  #   @employee = Employee.new
  # end

  # def edit
  #   @employee = Employee.find(params[:id])
  # end

  def create
    @employee = Employee.new(employee_params)
    @client_id = SecureRandom.urlsafe_base64(nil, false)
    @token     = SecureRandom.urlsafe_base64(nil, false)
    @employee.tokens[@client_id] = {
      token: BCrypt::Password.create(@token),
      expiry: (Time.now + DeviseTokenAuth.token_lifespan).to_i
    }
    @employee.skip_confirmation!
    respond_to do |format|
      if @employee.save
        EmployeeMailer.welcome_email(@employee).deliver_now
        format.json {render json: {status: :success, data: @employee}}
      else
        format.json {render json: {status: :error, data: @employee.errors}}
      end
    end
  end

  # def update
  #   @employee = Employee.find(params[:id])
  #   respond_to do |format|
  #     if @employee.update(employee_params)
  #       format.json {render json: {status: :ok, data: @employee}}
  #     else
  #       format.json {render json: {status: :error, data: @employee.errors}}
  #     end
  #   end
  # end

  # def destroy
  #   @employee = Employee.find(params[:id])
  #   respond_to do |format|
  #     if @employee.destroy
  #       format.json {render json: {status: :delete}}
  #   end
  # end

  private

  def employee_params
    params.require(:employee).permit(:provider, :uid, :first_name, :last_name, :email, :password, :password_confirmation, :code, :is_admin, :role_type)
  end


end
