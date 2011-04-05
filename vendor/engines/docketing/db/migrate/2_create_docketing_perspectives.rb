class CreateDocketingPerspectives < ActiveRecord::Migration

  def self.up
    create_table :docketing_perspectives do |t|
      t.string :name, :null => false

      t.timestamps
    end
    add_index :docketing_perspectives, :name, :unique => true
  end

  def self.down
    remove_index :docketing_perspectives, :name
    drop_table :docketing_perspectives
  end

end

