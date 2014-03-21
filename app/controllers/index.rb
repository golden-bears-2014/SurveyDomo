#add some thing here about if logged in shit
before do
  current_user
end

# shows list of posts and login button (posts are from newest to oldest just like craigslist
get '/' do
  erb :index
end


