class CoursesController < ApplicationController
    # index method gets called when the courses URL is requested 
    # index method gets mapped to the courses index.html.erb.
    def index 
        # call all method on Course model class.
        # all method selects all of the data in the course table
        # and returns the data as an array of objects.
        # store the array of objects in an instance variable.
        # instance variable is available to courses index.html.erb.
        @courses = Course2.all
    end
    
    # new method gets called when the courses new URL is requested.
    # new nethod is mapped to the courses new.html.erb
    def new
    end

    # create method gets called when the Create buttion is pushed on
    # the courses new.html.erb.
    def create
        # call constructor of Course model class giving it the
        # first name and last name parameters input in the courses
        # new.html.erb
        # constructor creates Course model object which is stored
        # in variable
        course = Course2.new(course_params)
        # call save method on Course object
        # save metod inserts the data in the Course model object
        # into the course table
        if course.save
            # if the save method succeeds, request the courses URL
            # which will rendor the courses index.html.erb in the browser
            redirect_to "/courses"
        else
            # get full messages associated with errors
            # store them in a Rails flash object named errors so that
            # the full message may be displayed in the courses new.html.erb
            flash[:errors] = course.errors.full_messages
            # if the save method succeeds, request the courses/new URL
            # which will rendor the courses new.html.erb in the browser
            redirect_to "/courses/new"
        end 
    end

    # show method gets called when the courses/:id URL is requested
    # show method is mapped to the courses show.html.erb
    def show
        # call find method on Course model class giving it the id sent
        # in the request
        # find method selects all of the data in the course table where
        # the id is equal to the id sent in the request 
        # store the array of course objects in an instance variable 
        # instance variable is available to courses show.html.erb
        @assignments = Course2.find(params[:id]).assignments
    end

    # edit metod gets called when the courses/:id/edit URL is requested
    # edit method is mapped out to the courses edit.html.erb
    def edit
        # call find method on Course model class giving it the id sent
        # in the request
        # the find method selects all of the data in the course table where
        # the id is equal to the id sent in the request
        # the selected data will be returned as an object
        # the object will be stored in an instance variable 
        # that will be available to the edit.html.erb 
        @course = Course2.find(params[:id])
    end

    # update method gets called when the update button is pushed on the 
    # courses edit.html.erb
    def update

        # call find method on Course model clss givng it the id sent in the 
        # request
        # find method selects all of the data in the course table where
        # the id is equal to the id sent in the request
        # the selected data will be returned as an object
        # the object will be stored in a variable
        course = Course2.find(params[:id])
        # call update method on Course object giving it the first name and
        # last name parameters input in the courses edit.html.erb
        # update method updates the data in the course table use the parameters
        if course.update(course_params)
            # if the updae method succeeds, request the courses URL which
            # will render the courses index.html.erb in the browser
            redirect_to "/courses"
        else
            # if the update fails, get full messages associated 
            # with errors
            # store them in a Rails flash object named errors so that
            # the full message may be displayed in the requested URL
            flash[:errors] = course.errors.full_messages
            # request the courses/:id/edit URL which will render courses
            # edit.html.erb 
            redirect_to "/courses/#{course.id}/edit"
    end
end
    
    # delete method get called when the courses/:id/delete URL is requested
    # delete method is mapped to the courses delete.html.erb
    def delete

        # call find method on Course model class giving it the id sent
        # in the request
        # the find method selects all of the data in the course table where
        # the id is equal to the id sent in the request
        # the selected data will be returned as an object
        # the object will be stored in an instance variable 
        # that will be available to the delete.html.erb 
        @course = Course2.find(params[:id])
    end

    # destroy metod gets called when the Delete button is pushed on the 
    # courses delete.html.erb
    def destroy
        course = Course2.find(params[:id])
        course.destroy
        redirect_to "/courses"
    end

    private
    def course_params
        # params in a Rails object that gets the specified request
        # parameters 
        params.require(:course).permit(:course_name)
    end

end
