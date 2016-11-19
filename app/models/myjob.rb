class Myjob < ActiveRecord::Base
  belongs_to :user
  # We should be able to bring back a list of jobs on the Myjob object
  belongs_to :job

end
