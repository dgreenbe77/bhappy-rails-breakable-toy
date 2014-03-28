class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :healthq, null: false, uniqueness: true
      t.string :wealthq, null: false, uniqueness: true
      t.string :cultureq, null: false, uniqueness: true
      # t.string :dramaq, null: false, uniqueness: true
      t.string :locationq, null: false, uniqueness: true
      t.string :spiritualityq, null: false, uniqueness: true
      t.string :relationshipq, null: false, uniqueness: true
      t.string :activityq, null: false, uniqueness: true
      # t.string :reflectivityq, null: false, uniqueness: true
      # t.string :civilizationq, null: false, uniqueness: true
      t.string :passionq, null: false, uniqueness: true
      t.string :satisfactionq, null: false, uniqueness: true
      t.string :self_viewq, null: false, uniqueness: true

      t.timestamps
    end
  end
end
