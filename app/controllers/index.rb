#add some thing here about if logged in shit
before do
  current_user
end

# shows list of posts and login button (posts are from newest to oldest just like craigslist
get '/' do
  @posts = Post.all
  erb :index
end

#shows SUBMIT POST page, MUST be logged in
get '/users/:id/posts/new' do
  @user = User.find(params[:id])
  erb :submit_post
end

#proceses form data from submit post page
post '/users/:id/posts' do
  @user = User.find(params[:id])
  @user.posts << Post.create(params[:post])
  redirect '/'
end

# shows the post (linked to url), a comment field, and a list of comments of the post. (comment only goes if logged in)
get '/posts/:id' do 
  @post = Post.find(params[:id])
  @user = User.find(@post.user_id)
  erb :post
end

#runs the submission and creates the comments from it and appends the DOM (AJAX?)
post '/posts/:id/comments' do
  @user = current_user
  @comment = Comment.create(params[:id].to_i, params[:comment_content], @user.id)
  redirect "/posts/#{params[:id].to_i}"
end

