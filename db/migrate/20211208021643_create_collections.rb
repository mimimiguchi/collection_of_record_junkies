class CreateCollections < ActiveRecord::Migration[6.0]
  def change
    create_table :collections do |t|
      t.integer        :music_id,             null: false
      t.string         :title,                null: false
      t.string         :artist,               null: false
      t.string         :year
      t.text           :description
      t.integer        :size_id,              null: false
      t.integer        :rpm_id,               null: false
      t.integer        :status_id,            null: false
      t.integer        :delivery_charge_id
      t.integer        :prefecture_id
      t.integer        :delivery_day_id
      t.integer        :price
      t.references     :user,                  null: false, foreign_key: true
      t.timestamps
    end
  end
end
