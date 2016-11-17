class AddEmployedToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :employed, :integer
  end
end
