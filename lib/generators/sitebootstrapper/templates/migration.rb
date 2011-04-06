class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table(:users) do |t|
      t.string :first_name, :limit => 100, :null => false
      t.string :last_name, :limit => 100, :null => false
      t.string :phone, :limit => 20
      t.float :lat
      t.float :lng
      t.string :photo_file_name
      t.string :photo_content_type
      t.integer :photo_file_size
      t.boolean :is_admin, :default => false
      t.database_authenticatable :null => false
      t.encryptable
      t.recoverable
      t.confirmable
      t.rememberable
      t.trackable
      t.timestamps
    end

    add_index :users, :email,                :unique => true
    add_index :users, :reset_password_token, :unique => true
    add_index :users, :confirmation_token,   :unique => true
  end

  def self.down
    drop_table(:users)
  end
end