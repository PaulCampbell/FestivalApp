class RenamePasswordColumnEncryptedpasswordForUser < ActiveRecord::Migration
  def self.up
    remove_column :users, :password
	add_column :users, :encrypted_password, :string
  end

  def self.down
	remove_column :user, :encrypted_password
	add_column :users, :password, :string
  end
end
