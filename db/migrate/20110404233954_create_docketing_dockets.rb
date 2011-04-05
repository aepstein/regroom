class CreateDocketingDockets < ActiveRecord::Migration

  def self.up
    create_table :docketing_dockets do |t|
      t.string :name, :null => false
      t.integer :position

      t.timestamps
    end

    add_index :docketing_dockets, :id

    # Required for seeding to work correctly if migrating from scratch
    User.reset_column_information
    Page.reset_column_information

    load(Rails.root.join('db', 'seeds', 'docketing_dockets.rb'))
  end

  def self.down
    UserPlugin.destroy_all({:name => "refinerycms_docketing"})

    Page.delete_all({:link_url => "/dockets"})

    drop_table :docketing_dockets
  end

end

