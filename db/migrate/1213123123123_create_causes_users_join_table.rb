# db/migrate/1213123123123_create_categories_users_join_table.rb
class CreateCausesUsersJoinTable < ActiveRecord::Migration
  def self.up
    create_table :causes_users, :id => false do |t|
      t.integer :cause_id
      t.integer :user_id
    end

    add_index :causes_users, [:cause_id, :user_id]
  end

  def self.down
    drop_table :causes_users
  end
end