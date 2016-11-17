class AddVerifiedToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :verified, :boolean
  end
end
