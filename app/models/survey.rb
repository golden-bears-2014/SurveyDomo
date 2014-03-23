class Survey < ActiveRecord::Base
  belongs_to :user
  has_many :questions

  # def self.create(params)

  #   # p params["survey_name"]

  #   s = self.new
  #   s.name = (params["survey_name"])
  #   s.save
  #   3.times do |index|
  #     s.questions << Question.create(content: params["question#{index+1}"])
  #     4.times do |cindex|
  #       s.questions.all[index].choices << Choice.create(content: params["choices#{index+1}"]["choice#{cindex+1}"])
  #     end
  #   end

  #   params.each_pair do |key,value|

  #     if key == "survey_name"
  #       s.name = value
  #     elsif key.match("question")
  #       s.questions << Question.create

  #   end

  #   s.save!
  #   return s

  # end

end
