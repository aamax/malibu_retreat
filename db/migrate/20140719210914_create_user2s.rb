class CreateUser2s < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :street, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :zip, :string
    add_column :users, :home_phone, :string
    add_column :users, :cell_phone, :string
    add_column :users, :fax, :string
  end
end
