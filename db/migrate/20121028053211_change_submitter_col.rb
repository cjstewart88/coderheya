class ChangeSubmitterCol < ActiveRecord::Migration
  change_table :links do |t|
    t.rename :submitter, :user_id
  end
end
