class CreateResidencePhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :residence_photos do |t|
      t.references :residence, null: false, foreign_key: true
      t.string :image

      t.timestamps
    end
  end
end
