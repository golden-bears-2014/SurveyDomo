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
  @survey = Survey.create(params)
  # Generate a sort of hash for the url by creating a random number via SecureRandom module

  redirect "/surveys/#{@survey.id}" #MVP would just be survey_id
end

get '/surveys/:id' do
  @survey = Survey.find(params[:id])
  erb :survey
end

post '/surveys/:id' do
  p "these are the params from the submitted survey"
  p params
  #NEED AN UPDATED SURVEY MODEL TO PROCESS THIS SO THAT I CAN SEE WHAT PARAMS I GET
  #AND WORK OFF THAT.
end

######## SHOW RESULTS OF SURVEY
get '/results/:id' do
  @survey = Survey.find(params[:id])
  @answers = Answer.find_by_survey_id(params[:id])  
  @questions = Survey.find(params[:id]).questions
  erb :survey_results
end
