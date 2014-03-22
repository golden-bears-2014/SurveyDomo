before do
  current_user
end
#----------- SESSIONS -----------
#shows login page
get '/sessions/new' do
  erb :sign_in
end

#processes login page
post '/sessions' do
  p "data from sign in page"
  p params
  p params[:user]
  authenticate_user(params[:user]) #should return
end

#stops session
delete '/sessions/:id' do #they user id
  session.clear
  redirect '/'
end


########## USER CONTROLLERS
#shows the profile page

#shows signup form
get '/users/new' do
  erb :sign_up
end

#processes new user form
post '/users' do
  @user = User.create(params[:user])
  session[:user_id] = @user.id
  redirect '/'
end

#shows user profile
get '/users/:id' do
  if session[:user_id] == params[:id]
    @user = User.find(params[:id])
    erb :profile
  else
    erb :please_log_in
  end
end

# #shows all the posts of the user (JQUERY)
# get '/users/:id/posts' do
#   @user = User.find(params[:id])
#   erb :user_posts
# end

# #shows all the comments of the user (JQUERY)
# get '/users/:id/comments' do
#   @user = User.find(params[:id])
#   erb :user_comments
# end
