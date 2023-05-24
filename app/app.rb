require "sinatra"
require "erb"

#Disable exceptions
disable :show_exceptions

#Return env vars
get "/environment" do
  "foo: #{ENV['AWS_KEY_ID']}\nexcited: #{ENV['AWS_SECRET_KEY_ID']}"
end
