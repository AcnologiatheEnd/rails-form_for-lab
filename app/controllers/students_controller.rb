class StudentsController < ApplicationController
  
  def new 
    @student = Student.new 
  end
  
  def create
    @student = Student.create(student_params(:first_name, :last_name))
    redirect_to student_path(@student)
  end
  
  def edit 
    @student = Student.find(params[:id])
  end
  
  def update
    @student = Student.update(student_params(:first_name, :last_name))
    redirect_to student_path(@student)
  end
  
  def show 
    @student = Student.find(params[:id])
  end 
  
  private
  
    # We pass the permitted fields in as *args;
    # this keeps `post_params` pretty dry while
    # still allowing slightly different behavior
    # depending on the controller action. This
    # should come after the other methods
	  def student_params(*args)
	    params.require(:student).permit(*args)
	  end
end
