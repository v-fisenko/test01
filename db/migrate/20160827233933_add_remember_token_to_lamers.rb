class AddRememberTokenToLamers < ActiveRecord::Migration[5.0]
  def change
    add_column :lamers, :remember_token, :string
    add_index  :lamers, :remember_token
  end
end
