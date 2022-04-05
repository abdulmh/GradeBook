# each route consists of 3 parts: 1 HTTP method, 2. URL to web page
# view being requested, 3. name of Ruby class method envoked when
# URL to web page view is requested.
Rails.application.routes.draw do
  # When a get request is made for the actors URL,
  # Rails envokes the index method in the actors Ruby controller class.
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
  get "courses/:id/delete" => "courses#delete"
  delete "courses/:id" => "courses#destroy"
end
