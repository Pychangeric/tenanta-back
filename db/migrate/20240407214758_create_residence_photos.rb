class CreateResidencePhotos < ActiveRecord::Migration[7.1]
  def change
    create_table :residence_photos do |t|
      t.references :residence, foreign_key: true
      t.string :image

      t.timestamps
    end
  end
end
