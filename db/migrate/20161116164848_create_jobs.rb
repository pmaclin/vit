class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :description
      t.integer :value

      t.timestamps null: false
    end
  end
end
