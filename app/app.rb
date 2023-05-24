require "sinatra"
require "erb"

#Disable exceptions
disable :show_exceptions

#Single route to call update_file method and print result
get "/ping" do
  "foo: #{ENV['foo']}\nexcited: #{ENV['excited']}"
end
