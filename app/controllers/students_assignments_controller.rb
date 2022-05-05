class StudentsAssignmentsController < ApplicationController
	# index method get called when the appearanceres URL is requested 
	# index method is mapped to the appearances index.html.rb
	def index 
		# call all method on assignemnt model class. 
		# all method selects all of data in the assignemnt table 
		# and returns the data as an array of objects. 
		# store the array of objects in an instance variable. 
		# instance variable is available to appearances index.html.erb
		@assignments = Assignment2.all
		@course = Course2.find(params[:id])
		
		return @assignments, @course
	end

# update method gets called when the add button 
# is pushed on the assignemnt index.html.erb
	def update
		# call find method on Assignment2 model class giving it the id sent in the request
		# find method selects all of the data in the assignment table where the 
		# id is equal to the id sent in the request 
		# the selected data will be returned as an object 
		# the object will be stored in a variable 
		assignment = Assignment2.find(assignment_params[:id])
		
		# call update method on Assignment2 object giving it the assignmentname and 
		# courseid parameters input in the students_assignments index.html.erb
		# update method updates the data in the assignment table use the parameters
		if assignment.update_column(:courseid, params[:id])
			# if the update method suceeds, request the actors URL which 
			# will render the actors index.html.erb in the browser 
			redirect_to "/courses"
		else 
			# if the update method fails, get the full messages asscioted with the errors
			# store them in the Rails flash object named errors so the full messages may be displayed
			# in the request URL 
			flash[:errors] = assignment.errors.full_messages
			# request the assignments/:id/edit URL which will render the actors edit.html.erb
			redirect_to "/courses/#{params[:id]}/students_assignments"
		end
		end	

		# show method gets called when the actors/:id URL is requested 
	# show method is mapped to the actors show.html.erb
	def show 
		# call find method on Actor model class giving it the id sent 
		# in the request 
		# find method selects all of the data in the actor table where
		# the id is equal to the id sent in the request and 
		# selected data will be returned in an array of movie objects 
		# store the array of movie objects in an instance variable 
		# store the array of movie objects in an instance variable 
		# instance variable is available to actors show.html.erb
		@assignments = Assignment2.where(courseid: params[:id].to_s)
	end

	private	
	def assignment_params
		# para is a Rails object that gets the specfied request 
		# parameters. 
		 params.require(:assignment).permit(:id)
	end 
end