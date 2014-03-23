class Survey < ActiveRecord::Base
  belongs_to :user
  has_many :questions


  def self.create(params)

    survey = Survey.new(name: params.shift[1])

    while (params.length > 0) do
      question = Question.create(content: params.shift[1])
      survey.questions << question
      for i in 1..4 do
        # shift off 1 comment and then shovel into the question created above
        question.choices << Choice.create(content: params.shift[1])
      end

    end
    survey.save!
    return survey
  end


end
