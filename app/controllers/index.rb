before do
  current_user
end

# shows list of posts and login button (posts are from newest to oldest just like craigslist
get '/' do
  erb :index
end


#shows SUBMIT POST page, MUST be logged in
get '/surveys/new' do
  if session[:user_id]
    erb :new_survey
  else
    erb :please_log_in
  end
end

post '/surveys/new' do

  @survey = Survey.create(params, @user.id)
  redirect "/surveys/#{@survey.id}"

end

get '/surveys/:id' do
  if session[:user_id]
    @survey = Survey.find(params[:id])
    erb :survey
  else
    erb :please_log_in
  end
end

post '/surveys/:id' do
  params.each_value do |choice_index|
    @answer = Answer.create(choice_id: choice_index, user_id: @user.id, survey_id: params[:id])
  end
  redirect '/'
end

######## SHOW RESULTS OF SURVEY
get '/results/:id' do
  @survey = Survey.find(params[:id])
  @answers = Answer.where("survey_id = ?", params[:id])
  @questions = Survey.find(params[:id]).questions
  erb :survey_results
end
