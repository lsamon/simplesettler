class AddImageToUserDetail < ActiveRecord::Migration[5.1][5.1]
  def change
      add_column :user_details, :image, :string
  end
end
