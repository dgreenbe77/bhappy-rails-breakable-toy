class CreateInfos < ActiveRecord::Migration
  def change
    create_table :infos do |t|
      # t.float :happy
      # t.float :control
      # t.float :civilization
      # t.float :drama
      # t.float :reflectivity
      t.float :health
      t.float :wealth
      t.float :culture
      t.float :location
      t.float :spirituality
      t.float :relationship
      t.float :activity
      t.float :passion
      t.float :satisfaction
      t.float :self_view
      t.string :url
      t.integer :user_id

      t.timestamps
    end
  end
end
