before do
  current_user
end

# shows list of posts and login button (posts are from newest to oldest just like craigslist
get '/' do
  erb :index
end


#shows SUBMIT POST page, MUST be logged in
get '/surveys/new' do
  erb :new_survey
end

post '/surveys/new' do

  @survey = Survey.create(params, @user.id)
  redirect "/surveys/#{@survey.id}"

end

get '/surveys/:id' do
  @survey = Survey.find(params[:id])
  erb :survey
end

post '/surveys/:id' do
  params.each_value do |choice_id|
    @answer = Answer.create(choice_id: choice_id, user_id: @user.id, survey_id: params[:id])
  end
  redirect '/'
end

######## SHOW RESULTS OF SURVEY
get '/results/:id' do
  @survey = Survey.find(params[:id])
  @answers = Answer.find_by_survey_id(params[:id])
  @questions = Survey.find(params[:id]).questions
  erb :survey_results
end
