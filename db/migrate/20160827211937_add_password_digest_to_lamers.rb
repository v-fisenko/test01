class AddPasswordDigestToLamers < ActiveRecord::Migration[5.0]
  def change
    add_column :lamers, :password_digest, :string
  end
end
