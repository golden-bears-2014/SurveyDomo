#CR a good start at tests, refactor with a let block and add more tests (at least one for each route)
require_relative 'spec_helper'

describe "IndexController Tests" do

	describe "Home page" do
		it "expects to load" do
      	get('/')
      	expect(last_response).to be_ok
		end
	end

	describe "'/surveys/new'" do
    # let!(:user) { User.create(
    #   :name => 'bob',
    #   :email => 'bob@example.com',
    #   :password_hash => 'test1234')
    # }
      it "should not allow user to create new survey if not logged in" do
        get('/surveys/new')
        expect(last_response.body).to include('Please log-in as an authorized user!')
        # expect(last_response).to render_template(:new_survey)
      end

      it "should redirect when user logs in" do
        post "/sessions", { :user => { :name => 'bob', :email => 'bob@example.com', :password => 'test1234' } }
        # response.should redirect_to("/admin")
        # response.code.should eq("302")
        # get "/admin/account"
        # puts "THIS IS THE RESPONSE!!"
        # p response
        last_response.status.should eq(302)
  end

      it "should redirect when survey is created" do
        post "/sessions", { :user => { :name => 'bob', :email => 'bob@example.com', :password => 'test1234' } }
        post "/surveys/new", { :name => 'awesome survey'}
        # response.should redirect_to("/admin")
        # response.code.should eq("302")
        # get "/admin/account"
        # puts "THIS IS THE RESPONSE!!"
        # p response
        last_response.status.should eq(302)
      end
    end

end
