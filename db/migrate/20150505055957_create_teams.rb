class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.string :constructor
      t.string :podiums
      t.string :driver1
      t.string :driver2
      t.integer :titles
      t.string :livery

      t.timestamps null: false
    end
  end
end
