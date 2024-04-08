class AddLocationToResidences < ActiveRecord::Migration[7.1]
  def change
    add_column :residences, :location, :string
    add_column :residences, :latitude, :float
    add_column :residences, :longitude, :float
  end
end
