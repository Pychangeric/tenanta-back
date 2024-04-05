class AddFieldsToAdmins < ActiveRecord::Migration[7.1]
  def change
    add_column :admins, :first_name, :string
    add_column :admins, :last_name, :string
    add_column :admins, :phone_number, :string
    add_column :admins, :national_id, :string
    add_column :admins, :gender, :string
  end
end
