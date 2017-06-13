class AddTimeStampsToPackages < ActiveRecord::Migration[5.1]
  def change
    add_column(:packages, :created_at, :datetime)
    add_column(:packages, :updated_at, :datetime)
  end
end
