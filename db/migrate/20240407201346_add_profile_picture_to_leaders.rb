class AddProfilePictureToLeaders < ActiveRecord::Migration[7.1]
  def change
    add_column :leaders, :profile_picture, :string
  end
end
