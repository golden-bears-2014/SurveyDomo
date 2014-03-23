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
  puts "*"*100
  puts "THIS IS THE USER"
  p user
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

#edit profile
get '/users/:id/edit' do
  return erb :sign_in if @user == nil
  return erb :please_log_in if @user.id != params[:id].to_i
  @user = User.find(params[:id])
  erb :edit_user
end

#update and show profile
put '/users/:id/edit' do
  @user = User.find(params[:id])
  @user.update_attributes(params[:user])
  redirect "users/#{@user.id}"
end
