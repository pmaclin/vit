class AddTimeToMyjob < ActiveRecord::Migration
  def change
    add_column :myjobs, :hours, :integer
  end
end
