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
    @user = User.find_by_username(user[:username])
    @password_hash = user[:password_hash]
    if @user == nil
     @error = "No matching log-in credentials."
     erb :sign_in
    else
      verify_password(@user, @password_hash)
    end
  end


  def verify_password(user, password_hash)
    @user = user
    if @user.password == password_hash
      session[:user_id] = @user.id
      @user
    else
      @error = "No matching log-in credentials."
      erb :sign_in
    end
  end

end









