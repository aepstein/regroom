class CreateDocketingItems < ActiveRecord::Migration

  def self.up
    create_table :docketing_items do |t|
      t.references :docketing_docket, :null => false
      t.references :docketing_perspective, :null => false
      t.integer :creator_user_id, :null => false
      t.integer :parent_id
      t.integer :lft, :null => false
      t.integer :rgt, :null => false
      t.string :status, :null => false
      t.string :title
      t.text :content, :null => false

      t.timestamps
    end
    add_index :docketing_items, [ :docketing_docket_id, :title ], :unique => true
    add_index :docketing_items, :docketing_perspective_id
    add_index :docketing_items, :creator_user_id
    add_index :docketing_items, :parent_id
    add_index :docketing_items, :docketing_docket_id
  end

  def self.down
    remove_index :docketing_items, :docketing_docket_id
    remove_index :docketing_items, :parent_id
    remove_index :docketing_items, :creator_user_id
    remove_index :docketing_items, :docketing_perspective_id
    remove_index :docketing_items, [ :docketing_docket_id, :title ]
    drop_table :docketing_items
  end

end

