before /^(?!\/(sessions|users\/new))/ do
  p "In before user"
  redirect '/' unless current_user
  # current_user #CR fix to protect all routes
end
#----------- SESSIONS -----------
#shows login page
get '/sessions/new' do
  erb :sign_in
end

#processes login page
post '/sessions' do
  p "Params: #{params[:user][:email]}"

  #CR clean up - using before filter and removing puts.
  @error = "No matching log-in credentials."
  @user = User.find_by_email(params[:user][:email])
  # return erb :sign_in if @user == nil
  verify_password(@user, params[:user][:password])
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
  @user = User.create(params[:user]) #CR add validations and logic to separate new and save
  session[:user_id] = @user.id
  redirect '/'
end

#shows user profile
get '/users/:id' do
  #CR move to before filter
  # return erb :please_log_in if @user.id != params[:id].to_i
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
