class AddAvatarToCauses < ActiveRecord::Migration
  def self.up
  	add_attachment :causes, :avatar
  end
  def self.down
  	remove_attachment :causes, :avatar
  end
end
