describe Choice do
  should belong_to(:question)
end

describe Question do
  should belong_to(:survey)
  it { should have_many(:choices) }
end

describe Survey do
  should belong_to(:user)
  it { should have_many(:questions) }
end

describe User do
  it { should have_many(:user_answers) }
  it { should have_many(:surveys) }
end

describe 'Routing' do
  it { should route(:get, '/surveys/1').to('surveys#show', id: 1) }
end