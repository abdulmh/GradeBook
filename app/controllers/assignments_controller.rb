class AssignmentsController < ApplicationController 
	# index method gets called when the assignments URL is requested. 
	# index method gets mapped to assignments index.html.erb.
	def index 
		# call all method on assignment model class. 
		# all method selects all of data in the assignment table 
		# and returns the data as an array of objects. 
		# store the array of objects in an instance variable. 
		# instance variable is available to assignments index.html.erb
		@assignments = Assignment.all
	end

	# new method gets called when the assignments/new URL is requested.
	# new method is mapped to the assignments new.html.erb 
	def new	
	end 
	
	# create method gets called when the Create button is pushed on 
	# the assignments new.html.erb.
	def create
		# call constructor of assignment model class giving it the 
		# full name and email parameters input in the assignments 
		# new.html.erb
		# constructor creates assignment model object which is stored 
		# in variable 
		assignment = Assignment.new(assignment_params)
		# call save method on assignment object 
		# save method inserts the data in the assignment model object 
		# into the assignment table 
		if assignment.save
			# if the save method succeeds, request the assignments URL
			# which will rendor the assignments index.html.erb in the browser
			redirect_to "/assignments" 
		else
			# get full messages associated with errors
			# store them in Rails flash object named errors so that 
			# the full messages may be displayed in the assignments new.html.erb 
			flash[:errors] = assignment.errors.full_messages
			# if the save method fails, request the assignments/new URL
			# which will rendor the assignments new.html.erb in the browser
			redirect_to "/assignments/new"
		end 
	end


	# edit method gets called when the assignments/:id/edit URL is requested 
	# edit method is mapped to the assignments edit.html.erb
	def edit
		# call find method on assignment model class giving it the id sent 
		# in the request 
		# the find method selects all of the data in the assignment table where 
		# the id is equalk to the id sent in the request 
		# the selected data will be returned as an object 
		# the object will be stored in an instance variable that will be 
		# available to the edit.html.erb
		@assignment = Assignment.find(params[:id])
	end

	# update method gets called when the update button 
	# is pushed on the assignments edit.html.erb
	def update
		# call find method on assignment model class giving it the id sent in the request
		# find method selects all of the data in the assignment table where the 
		# id is equal to the id sent in the request 
		# the selected data will be returned as an object 
		# the object will be stored in a variable 
		assignment = Assignment.find(params[:id])
		# call update method on assignment object giving it the first name and 
		# last name parameters input in the assignment edit.html.erb
		# update method updates the data inthe assignment table use the parameters
		if Assignment.update(assignment_params)
			# if the update method suceeds, request the assignments URL which 
			# will render the assignments index.html.erb in the browser 
			redirect_to "/assignments"
		else 
			# if the update method fails, get the full messages asscioted with the errors
			# store them in the Rails flash object named errors so the full messages may be displayed
			# in the request URL 
			flash[:errors] = Assignment.errors.full_messages
			# request the assignments/:id/edit URL which will render the assignments edit.html.erb
			redirect_to "/assignments/#{Assignment.id}/edit"
		end
		end	


		# delete method gets called when the assignments/:id/delete URL is requested 
		# delete method is mapped to the assignments delete.html.erb
		def delete
		# call find method on assignment model class giving it the id sent 
		# in the request 
		# the find method selects all of the data in the assignment table where 
		# the id is equalk to the id sent in the request 
		# the selected data will be returned as an object 
		# the object will be stored in an instance variable that will be 
		# available to the delete.html.erb
		@assignment = Assignment.find(params[:id])
		end

		# destroy method gets called when the Delete button is pushed on the 
		# assignments delete.html.erb
		def destroy
			assignment = Assignment.find(params[:id])
			assignment.destroy
			redirect_to "/assignments"
		end



	private	
	def assignment_params
		# para is a Rails object that gets the specfied request 
		# parameters. 
		params.require(:assignment).permit(:assignmentname, :totalpoints)
	end

end