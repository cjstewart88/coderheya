class AddClicksToLinks < ActiveRecord::Migration
  change_table :links do |t|
    t.integer :clicks, :default => 0
  end
end
