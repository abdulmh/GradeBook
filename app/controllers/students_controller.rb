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
end
