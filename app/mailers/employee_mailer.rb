class EmployeeMailer < ApplicationMailer
  default from: 'notifications@example.com'
  # layout "mailer"
  def welcome_email(employee)
    @employee = employee
    @url  = 'http://example.com/login'
    # @token = employee.token_is_current?(@token,@client_id)
    mail(to: @employee.email, subject: 'Welcome to My Awesome Site',template_name: "employee_mailer") do |format|
      format.html {render employee_mailer: 'welcome_email', template_name: "employee_mailer" }
      format.text 
    end
  end

end
