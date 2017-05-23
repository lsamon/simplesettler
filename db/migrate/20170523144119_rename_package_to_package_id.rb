class RenamePackageToPackageId < ActiveRecord::Migration
  def change
    rename_column :payments, :package, :package_id
  end
end
