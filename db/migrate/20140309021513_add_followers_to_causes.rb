class AddFollowersToCauses < ActiveRecord::Migration
  def change
    add_column :causes, :followers, :text
  end
end
