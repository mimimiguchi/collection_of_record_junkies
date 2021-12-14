class CreateWants < ActiveRecord::Migration[6.0]
  def change
    create_table :wants do |t|
      t.references :user,       null: false, foreign_key: true
      t.references :collection, null: false, foreign_key: true

      t.timestamps
      t.index [:user_id, :collection_id], unique: true
    end
  end
end
