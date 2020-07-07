class Admin::DepartmentsController < AdminController
  def index
    @departments = Department.all
  end

  def show; end

  def new
    @department = Department.new
  end

  def create
    @department = Department.new department_params
    if @department.save
      flash[:success] = t "admin.departments.create.success"
      redirect_to admin_department_path @department
    else
      flash[:danger] = t "admin.departments.create.danger"
      render :new
    end
  end

  private

  def department_params
    params.require(:department).permit Department::DEPARTMENT_PARAMS
  end
end
