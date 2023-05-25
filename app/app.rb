require "sinatra"
require "erb"

#Disable exceptions
disable :show_exceptions

#Return env vars
get "/environment" do
  "AWS_KEY_ID: #{ENV['AWS_KEY_ID']}\nAWS_SECRET_KEY_ID: #{ENV['AWS_SECRET_KEY_ID']}"
end
