class DropResidencePhotosTable < ActiveRecord::Migration[7.1]
  def up
    drop_table :residence_photos, if_exists: true
  end

  def down
    create_table :residence_photos do |t|
      t.references :residence, foreign_key: true
      t.string :image

      t.timestamps
    end
  end
end
