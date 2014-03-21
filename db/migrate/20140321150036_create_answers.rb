class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.belongs_to :user
      t.belongs_to :survey
      t.belongs_to :choice
      t.timestamps
    end
  end
end
