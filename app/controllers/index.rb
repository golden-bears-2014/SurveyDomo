  #CR - this gets the current user but doesn't force login before viewing pages
before /^(?!\/(sessions\/*|users\/new))/ do
  redirect '/sessions/new' unless current_user
  # current_user #CR fix to protect all routes
end


# shows list of posts and login button (posts are from newest to oldest just like craigslist
get '/' do
  erb :index
end


#shows SUBMIT POST page, MUST be logged in
get '/surveys/new' do
  #CR - use your before filter to force login
  #@user.nil? ? (erb :please_log_in) : (
  erb :new_survey
end

post '/surveys/new' do  #CR this is not a RESTful route.
  #CR - do you have validations on your survey? If not you should if so, create
  # should be separated into new and save logic
  @survey = Survey.create(params, current_user.id)
  redirect "/surveys/#{@survey.key}"

end

get '/surveys/:key' do
  # return erb :please_log_in if @user == nil
  @survey = Survey.find_by_key(params[:key])
  erb :survey
end

post '/surveys/:id' do
  params.each_value do |choice_index|
    @answer = Answer.create(choice_id: choice_index, user_id: current_user.id, survey_id: params[:id])
    #CR create your answers on the current survey - don't pass in user.id and survey.id
  end
  redirect '/'
end

######## SHOW RESULTS OF SURVEY
get '/results/:id' do
  @survey = Survey.find(params[:id])
  # return erb :please_log_in if @user.id != @survey.user_id
  #CR you already have the survey so you can use it to get the answers and questions without
  # accessing the database again.
  @answers = Answer.where("survey_id = ?", params[:id])
  @questions = Survey.find(params[:id]).questions
  erb :survey_results
end
