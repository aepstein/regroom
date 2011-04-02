class CreateDocketPerspectives < ActiveRecord::Migration

  def self.up
    create_table :docket_perspectives do |t|
      t.string :name, :null => false

      t.timestamps
    end
    add_index :docket_perspectives, :name, :unique => true
    load(Rails.root.join('db', 'seeds', 'docket_perspectives.rb'))
  end

  def self.down
    remove_index :docket_perspectives, :name
    drop_table :docket_perspectives
  end

end

