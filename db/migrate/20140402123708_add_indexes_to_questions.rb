class AddIndexesToQuestions < ActiveRecord::Migration
  def change
    add_index :questions, :main_postq, unique: true
    add_index :questions, :why_postq, unique: true

  end
end
