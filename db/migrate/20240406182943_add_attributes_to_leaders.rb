class AddAttributesToLeaders < ActiveRecord::Migration[7.1]
  def change
    add_column :leaders, :first_name, :string
    add_column :leaders, :last_name, :string
    add_column :leaders, :phone_number, :string
    add_column :leaders, :national_id, :string
    add_column :leaders, :gender, :string

    # Add any validations you need here

    # Add an index if necessary
     add_index :leaders, :phone_number, unique: true
     add_index :leaders, :national_id, unique: true

  end
end
