class CreateDocketPerspectives < ActiveRecord::Migration

  def self.up
    create_table :docket_perspectives do |t|
      t.string :name, :null => false

      t.timestamps
    end
    add_index :docket_perspectives, :name, :unique => true
  end

  def self.down
    remove_index :docket_perspectives, :name
    drop_table :perspectives
  end

end

