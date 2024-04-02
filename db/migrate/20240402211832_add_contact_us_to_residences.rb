class AddContactUsToResidences < ActiveRecord::Migration[7.1]
  def change
    add_column :residences, :contact_us, :string
  end
end
