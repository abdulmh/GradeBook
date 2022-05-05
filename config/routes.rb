# each route consists of 3 parts: 1 HTTP method, 2. URL to web page
# view being requested, 3. name of Ruby class method envoked when
# URL to web page view is requested.
Rails.application.routes.draw do
  # When a get request is made for the students URL,
  # Rails envokes the index method in the students Ruby controller class.
  # Rails automatically maps the index method to a web page view names
  # index.html.erb and serves the webpage to the browser where its
  # rendered.
  get "courses" => "courses#index"
  get "courses/new" => "courses#new"
  # When a post request is made for the courses URL,
  # Rails envokes the create method in the courses Ruby controller class
  post "courses" => "courses#create"
  get "courses/:id/edit" => "courses#edit"
  post "courses/:id" => "courses#update"
  get "courses/:id" => "courses#show"
  get "courses/:id/delete" => "courses#delete"
  delete "courses/:id" => "courses#destroy"
  get "students" => "students#index"
  get "students/new" => "students#new"
  get "students/:id" => "students#show"
  get "students/:id/edit" => "students#edit"
  post "students/:id" => "students#update"
  post "students" => "students#create"
  get "students/:id/delete" => "students#delete"
  delete "students/:id" => "students#destroy"
  get "assignments" => "assignments#index"
  get "assignments/new" => "assignments#new"
  get "assignments/:id/edit" => "assignments#edit"
  post "assignments/:id" => "assignments#update"
  post "assignments" => "assignments#create"
  get "assignments/:id/delete" => "assignments#delete"
  delete "assignments/:id" => "assignments#destroy"
  get "courses/:id/students_assignments" => "students_assignments#index"
  post "students_assignments/:id" => "students_assignments#update"
  get "assignments/:id" => "studentgrades#index"
  get "studentgrades/gradeStudentAssignment" => "studentgrades#gradeStudentAssignment"
  get "courses/:id/students_assignments/show" => "students_assignments#show"
  get "studentgrades/index" => "studentgrades#index"
  get "roster" => "roster#index"
  post "roster" => "roster#create"
end
