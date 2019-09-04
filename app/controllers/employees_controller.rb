class EmployeesController < ApplicationController
    def index
        @employees = Employee.all
    end

    def show
        @employee = Employee.find(params[:id])
        @dog = @employee.dog
    end

    def new
        @employee = Employee.new
    end

    def edit
        @employee = Employee.find(params[:id])
        @dogs = Dog.all
    end

    def create
        @employee = Employee.new(params[:id])
        if @employee.valid?
            @employee.save
            redirect_to employee_path(@employee)
          else
            flash.now[:messages] = @employee.errors.full_messages[0]
            @dogs = Dog.all
            render :new
          end
    end

    def update
        @employee = Employee.find(params[:id])
        @dogs = Dog.all
        if @employee.update(employee_params)
            @employee.update(employee_params)
            redirect_to employee_path(@employee)
          else
            flash.now[:messages] = @employee.errors.full_messages[0]
            @dogs = Dog.all
            render :edit
        end
    end

    def destroy
        @employee = Employee.find(params[:id])
        @employee.destroy
        redirect_to employees_path
    end

    #----------------------PARAMS-------------------------------
    def employee_params
        params.require(:employee).permit(:fist_name, :last_name, :alias, :title, :office, :img_url, :dog_id)
    end

end
