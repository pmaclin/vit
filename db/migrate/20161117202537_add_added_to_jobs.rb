class AddAddedToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :added, :boolean
  end
end
