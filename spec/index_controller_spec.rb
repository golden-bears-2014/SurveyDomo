require_relative 'spec_helper'

describe "IndexController Tests" do

	describe "Home page" do
		it "expects to load" do
      		get('/')
      		expect(last_response).to be_ok
		end
	end

	describe "'/surveys/new'" do
      it "should show a title form" do
        get('/surveys/new')
        expect(last_response.body).to include("Title")
      end

      it "route redirects to survey page" do
        # session[:user_id] != nil
        survey = Survey.create!(name: "sample")
        post('/surveys/new', {:id => survey.id} )
        expect(last_response).to be_redirect
        # response.should redirect_to '/surveys/{#survey.id}'
      end

      it "expects to add a survey to the User's page" do
      	get('/results/:id')
      	expect()
      end

    end

    # describe "'/results/1'" do
     #create survey obj filled out with whatever params 
    
    # end

 #    	questions = Survey.find(params[:id]).questions :questions
 #    	expect(:questions).have_at_least(4).things


 #  		it "should append array items to http://www.google.com/search?num=100&q=" do
 #    		make_urls(["pie"]).should == ["http://www.google.com/search?num=100&q=pie"]
 #  		end
	# end

end

# describe "User"
#   describe ".top" do
#     before { FactoryGirl.create_list(:user, 3) }
#     it { expect(User.top(2)).to have(2).item }
#   end
# end




# it 'creates a resource' do
#   expect(response).to respond_with_content_type(:json)
# end