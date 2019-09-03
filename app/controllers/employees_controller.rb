class EmployeesController < ApplicationController
    def index
        @employees = Employee.all
    end

    def show
        @employee = Employee.find(params[:id])
    end

    def new
        @employee = Employee.new
    end

    def create
        @employee = Employee.new(employee_params)
        if @employee.valid?
            @employee.save
            redirect_to employee_path(@employee)
        else
            flash.now[:messages] = @employee.errors.full_messages[0]
            render :new
        end
    end

    def edit
        @employee = Employee.find(params[:id])
    end

    def update
        @employee = Employee.find(params[:id])
        if @employee.update(employee_params)
            @employee.save
            redirect_to employee_path(@employee)
        else
            flash.now[:messages] = @employee.errors.full_messages[0]
            render :edit
        end
    end

    def employee_params
        params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :dog_id, :img_url)
    end

end
