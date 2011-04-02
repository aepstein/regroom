class CreateDockets < ActiveRecord::Migration

  def self.up
    create_table :dockets do |t|
      t.string :name
      t.integer :position

      t.timestamps
    end

    add_index :dockets, :id

    load(Rails.root.join('db', 'seeds', 'dockets.rb'))
  end

  def self.down
    UserPlugin.destroy_all({:name => "dockets"})

    Page.delete_all({:link_url => "/dockets"})

    drop_table :dockets
  end

end
