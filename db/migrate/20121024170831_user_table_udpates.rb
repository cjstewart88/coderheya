class UserTableUdpates < ActiveRecord::Migration
  change_table :users do |t|
    t.string :gravatar_id
    t.rename :name, :nickname
  end
end
