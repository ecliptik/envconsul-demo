require "sinatra"
require "erb"

#Disable exceptions
disable :show_exceptions

#Single route to call update_file method and print result
get "/environment" do
  "foo: #{ENV['AWS_KEY_ID']}\nexcited: #{ENV['AWS_SECRET_KEY_ID']}"
end
