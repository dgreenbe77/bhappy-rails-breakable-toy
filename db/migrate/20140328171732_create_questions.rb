class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :healthq, null: false
      t.string :wealthq, null: false
      t.string :cultureq, null: false
      t.string :locationq, null: false
      t.string :spiritualityq, null: false
      t.string :relationshipq, null: false
      t.string :activityq, null: false
      t.string :passionq, null: false
      t.string :satisfactionq, null: false
      t.string :self_viewq, null: false

      t.timestamps
    end
  end
end
