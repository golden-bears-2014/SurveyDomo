helpers do
  def link_to(url,text=url)
    "<a href=\"/#{url}\"> #{text} </a>"
  end

  def current_user
    if session
      @user = User.select {|user| user.id == session[:user_id]}.first
    else
      @user = nil
    end
  end

  def authenticate_user(user = {})
    p "authenticating_user"
    p "this is the user"
    p @user = User.find_by_email(user[:email])
    @password_hash = user[:password_hash]
    p "checking if user is nil"
    if @user == nil
     @error = "No matching log-in credentials."
     erb :sign_in
    else
      p "user found! verifying password"
      verify_password(@user, @password_hash)
    end
  end


  def verify_password(user, password_hash)
    p "checking password"
    @user = user
    if @user.password == password_hash
      p "password verified"
      session[:user_id] = @user.id
      redirect "users/#{@user.id}"
    else
      @error = "No matching log-in credentials."
      erb :sign_in
    end
  end

end









