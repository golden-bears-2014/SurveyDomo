# shows list of posts and login button (posts are from newest to oldest just like craigslist
get '/' do
  #giant DOMO in erb
  erb :
end


#shows SUBMIT POST page, MUST be logged in
get '/surveys/new' do

  erb :new_survey
end

post '/surveys/new' do
  @survey = Survey.create(params)
  # Generate a sort of hash for the url by creating a random number via SecureRandom module
  redirect '/surveys/:id' #MVP would just be survey_id
end


