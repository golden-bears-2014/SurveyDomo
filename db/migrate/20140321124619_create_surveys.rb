class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.string :name
      t.belongs_to :user
      t.string :key
      t.timestamps
    end
  end
end
