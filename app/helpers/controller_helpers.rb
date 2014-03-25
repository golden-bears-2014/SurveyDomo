helpers do
  def link_to(url,text=url)
    "<a href=\"/#{url}\"> #{text} </a>"
  end

  def current_user
      @current_user = User.find(session[:user_id]) if session[:user_id]
  end

  def verify_password(user, new_password)
    # p "checking password"
    user.password == new_password
      # p "password verified!"

  #CR separate view.
  #   else
  #     @error = "No matching log-in credentials."
  #     erb :sign_in
  #   end
   end

end









