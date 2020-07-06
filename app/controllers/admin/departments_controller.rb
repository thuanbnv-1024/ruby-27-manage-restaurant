class Admin::DepartmentsController < AdminController
  def index
    @departments = Department.all
  end
end
