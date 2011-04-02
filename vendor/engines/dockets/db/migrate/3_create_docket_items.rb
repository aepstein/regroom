class CreateDocketItems < ActiveRecord::Migration

  def self.up
    create_table :docket_items do |t|
      t.references :docket, :null => false
      t.references :perspective, :null => false
      t.integer :creator_user_id, :null => false
      t.integer :parent_id
      t.integer :lft, :null => false
      t.integer :rgt, :null => false
      t.string :status, :null => false
      t.string :title
      t.text :content, :null => false

      t.timestamps
    end
    add_index :docket_items, [ :docket_id, :title ], :unique => true
    add_index :docket_items, :perspective_id
    add_index :docket_items, :creator_user_id
    add_index :docket_items, :parent_id
    add_index :docket_items, :docket_id
  end

  def self.down
    remove_index :docket_items, :docket_id
    remove_index :docket_items, :parent_id
    remove_index :docket_items, :creator_user_id
    remove_index :docket_items, :perspective_id
    remove_index :docket_items, [ :docket_id, :title ]
    drop_table :docket_items
  end

end

