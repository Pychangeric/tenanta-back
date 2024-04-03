class CreateResidences < ActiveRecord::Migration[7.1]
  def change
    create_table :residences do |t|
      t.string :house_code
      t.string :type
      t.string :status
      t.decimal :price
      t.string :town
      t.string :google_maps
      t.text :user_agreement
      t.text :description
      t.string :institution
      t.string :contact_number, default: '0794457203'

      t.timestamps
    end
    add_index :residences, :house_code
  end
end
