class AddIndexesToQuestions < ActiveRecord::Migration
  def change
    add_index :questions, :healthq, unique: true
    add_index :questions, :wealthq, unique: true
    add_index :questions, :cultureq, unique: true
    add_index :questions, :locationq, unique: true
    add_index :questions, :spiritualityq, unique: true
    add_index :questions, :relationshipq, unique: true
    add_index :questions, :activityq, unique: true
    add_index :questions, :passionq, unique: true
    add_index :questions, :satisfactionq, unique: true
    add_index :questions, :self_viewq, unique: true
  end
end
