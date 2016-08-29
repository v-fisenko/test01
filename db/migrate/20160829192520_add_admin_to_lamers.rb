class AddAdminToLamers < ActiveRecord::Migration[5.0]
  def change
    add_column :lamers, :admin, :boolean, default: false
  end
end
