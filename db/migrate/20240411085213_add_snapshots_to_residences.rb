class AddSnapshotsToResidences < ActiveRecord::Migration[7.1]
  def change
    add_column :residences, :snapshots, :json
  end
end
