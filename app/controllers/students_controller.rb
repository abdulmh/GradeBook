class StudentsController < ApplicationController 
	# index method gets called when the students URL is requested. 
	# index method gets mapped to students index.html.erb.
	def index 
		# call all method on Student model class. 
		# all method selects all of data in the student table 
		# and returns the data as an array of objects. 
		# store the array of objects in an instance variable. 
		# instance variable is available to students index.html.erb
		@students = Student.all
	end

	# new method gets called when the students/new URL is requested.
	# new method is mapped to the students new.html.erb 
	def new	
	end 
	
	# create method gets called when the Create button is pushed on 
	# the students new.html.erb.
	def create
		# call constructor of student model class giving it the 
		# full name and email parameters input in the students 
		# new.html.erb
		# constructor creates student model object which is stored 
		# in variable 
		student = Student.new(student_params)
		# call save method on student object 
		# save method inserts the data in the student model object 
		# into the student table 
		if student.save
			# if the save method succeeds, request the students URL
			# which will rendor the students index.html.erb in the browser
			redirect_to "/students" 
		else
			# get full messages associated with errors
			# store them in Rails flash object named errors so that 
			# the full messages may be displayed in the students new.html.erb 
			flash[:errors] = student.errors.full_messages
			# if the save method fails, request the students/new URL
			# which will rendor the students new.html.erb in the browser
			redirect_to "/students/new"
		end 
	end


	# edit method gets called when the students/:id/edit URL is requested 
	# edit method is mapped to the students edit.html.erb
	def edit
		# call find method on student model class giving it the id sent 
		# in the request 
		# the find method selects all of the data in the student table where 
		# the id is equalk to the id sent in the request 
		# the selected data will be returned as an object 
		# the object will be stored in an instance variable that will be 
		# available to the edit.html.erb
		@student = Student.find(params[:id])
	end

	# update method gets called when the update button 
	# is pushed on the students edit.html.erb
	def update
		# call find method on student model class giving it the id sent in the request
		# find method selects all of the data in the student table where the 
		# id is equal to the id sent in the request 
		# the selected data will be returned as an object 
		# the object will be stored in a variable 
		student = Student.find(params[:id])
		# call update method on student object giving it the first name and 
		# last name parameters input in the student edit.html.erb
		# update method updates the data inthe student table use the parameters
		if student.update(student_params)
			# if the update method suceeds, request the students URL which 
			# will render the students index.html.erb in the browser 
			redirect_to "/students"
		else 
			# if the update method fails, get the full messages asscioted with the errors
			# store them in the Rails flash object named errors so the full messages may be displayed
			# in the request URL 
			flash[:errors] = student.errors.full_messages
			# request the students/:id/edit URL which will render the students edit.html.erb
			redirect_to "/students/#{student.id}/edit"
		end
		end	


		# delete method gets called when the students/:id/delete URL is requested 
		# delete method is mapped to the students delete.html.erb
		def delete
		# call find method on student model class giving it the id sent 
		# in the request 
		# the find method selects all of the data in the student table where 
		# the id is equalk to the id sent in the request 
		# the selected data will be returned as an object 
		# the object will be stored in an instance variable that will be 
		# available to the delete.html.erb
		@student = Student.find(params[:id])
		end

		# destroy method gets called when the Delete button is pushed on the 
		# students delete.html.erb
		def destroy
			student = Student.find(params[:id])
			student.destroy
			redirect_to "/students"
		end



private	
	def student_params
		# para is a Rails object that gets the specfied request 
		# parameters. 
		params.require(:student).permit(:fullname, :email)
	end

end