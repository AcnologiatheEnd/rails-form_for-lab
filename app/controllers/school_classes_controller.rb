class SchoolClassesController < ApplicationController
  
  def new 
    @school_class = SchoolClass.new
  end
  
  def create
    @school_class = SchoolClass.create(post_params(:title, :room_number))
    redirect_to school_class_path(@school_class)
  end
  
  def show 
    	@school_class = SchoolClass.find(params[:id])
  end
  private
	
	# We pass the permitted fields in as *args;
  # this keeps `post_params` pretty dry while
  # still allowing slightly different behavior
  # depending on the controller action. This
  # should come after the other methods
	def post_params(*args)
	  params.permit(*args)
	end
end
