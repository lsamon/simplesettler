class RenamePackageToPackageId < ActiveRecord::Migration[5.1]
  def change
    rename_column :payments, :package, :package_id
  end
end
