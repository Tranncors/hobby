== README
First of all you will need to save the the parsed header tags i.e the H1, H2, H3 and Href
I use the rake task route to save the parsed headers

You will have to run this manually in the commandline:
rake add:new_notes


The above rake task is saved insde the lib/tasks folder and it will save the parsed 
html headers into the database provided the api is created  correctly inside the 
controllers/api/v1 folder and the database and migration were created as well with 
the model file to match. This is considered the first endpoint


The second endpoint will be listing te saved header tags as instructed.

That can be done easily as an api displayed as a json.
First step would be to create route for it in the config/routes.rb, basically add this:

namespace :api do
  namespace :v1 do
    resources :items, only:[:index]
  end
end

then add the gem responsers to the gemfile and run bundle install 

In the ItemsController file create the index actions and pass respond_with to it.
the ItemsController is child of BaseController which itself is a child of ApplicationController
inside the BaseControllercontroller you will have to initialize the respond_to method

With the above you can simply view the json api in your browser pointing to 
  localhost/api/v1/items.json

The testing part I used the rspec only.
First I tested for response status and response content_type which should be json.

Second I tested for ActiveRecord errors and validates presence of attributes.




Please feel free to use a different markup language if you do not plan to run
<tt>rake doc:app</tt>.
