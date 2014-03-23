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

  def verify_password(user, password_hash)
    p "checking password"
    if user.password == password_hash
      p "password verified!"
    else
      @error = "No matching log-in credentials."
      erb :sign_in
    end
  end

end









