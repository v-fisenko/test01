class AddIndexToLamersEmail < ActiveRecord::Migration[5.0]
  def change
    add_index :lamers, :email, unique:true
  end
end
