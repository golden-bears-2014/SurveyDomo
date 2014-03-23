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
  @error = "No matching log-in credentials." 
  user = params.fetch("user")
  @user = User.find_by_email(user[:email])
  return erb :sign_in if @user == nil
  verify_password(@user, user[:password_hash])
  session[:user_id] = @user.id
  redirect "users/#{@user.id}"
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
  return erb :please_log_in if @user.id != params[:id].to_i
  @user = User.find(params[:id])
  erb :profile
end
