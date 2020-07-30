class Admin::DepartmentsController < AdminController
  before_action :find_department, only: %i(edit update destroy)

  def index
    @departments = Department.all
  end

  def show; end

  def new
    @department = Department.new
  end

  def create
    @department = Department.create department_params
    respond_to :js
  end

  def edit; end

  def update
    @department.update department_params
    respond_to :js
  end

  def destroy
    @department.destroy
  end

  private

  def department_params
    params.require(:department).permit Department::DEPARTMENT_PARAMS
  end

  def find_department
    @department = Department.find_by id: params[:id]
    return if @department

    flash[:danger] = t "find_department.danger"
    redirect_to admin_departments_path
  end
end
