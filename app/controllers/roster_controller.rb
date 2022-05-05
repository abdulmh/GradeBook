class RosterController < ApplicationController
	# index method gets called when the roster URL is requested
    # index method is mapped to the roster index.html.erb
    def index
        # call all method on Course model class.
        # all method selects all of the data in the course2s table
        # and returns the data as an array of objects.
        # store the array of objects in an instance variable.
        # instance variable is avialable to roster index.html.erb.
        @course2 = Course2.all
        # call all method on Student model class.
        # all method selects all of the data in the student table
        # and returns the data as an array of objects.
        # store the array of objects in an instance variable.
        # instance variable is avialable to roster index.html.erb.
        @student = Student.all
        return @course2, @student
    end

    # create method gets called when the Create button is pushed on the
    # roster index.html.erb
    def create
        # call constructor of CourseStudent model class giving it the
        # course2 id and student id parameters input in the roster
        # index.html.erb
        # constructor creates CourseStudent model object which is stored
        # in variable
		roster = Roster.new(roster_params)
        # call save method on CourseStudent object
        # save metod inserts the data in the CourseStudent model object
        # into the roster table
        if roster.save
            # if the save method succeeds, request the courses URL
            # which will rendor the courses index.html.erb in the browser
            redirect_to "/courses"
        else
            # get full messages associated with errors
            # store them in a Rails flash object named errors so that
            # the full message may be displayed in the roster index.html.erb
            flash[:errors] = roster.errors.full_messages
            # if the save method succeeds, request the roster/new URL
            # which will rendor the roster index.html.erb in the browser
            redirect_to "/courses/index"
        end
    end

    private
    def roster_params
        # params in a Rails object that gets the specified request
        # parameters 
        params.require(:roster).permit(:course2_id, :student_id)
    end
end