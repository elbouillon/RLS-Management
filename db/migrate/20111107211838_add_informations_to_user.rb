class AddInformationsToUser < ActiveRecord::Migration
  def change
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
    add_column :users, :address, :string
    add_column :users, :zip, :integer
    add_column :users, :city, :string
    add_column :users, :phone, :string
    add_column :users, :mobile, :string
    add_column :users, :fsih_license_number, :integer
  end
end
