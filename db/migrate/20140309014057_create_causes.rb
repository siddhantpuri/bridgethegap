class CreateCauses < ActiveRecord::Migration
  def change
    create_table :causes do |t|
      t.string :name
      t.string :dateCreated
      t.integer :creator
      t.string :description
      t.string :tagline

      t.timestamps
    end
  end
end
