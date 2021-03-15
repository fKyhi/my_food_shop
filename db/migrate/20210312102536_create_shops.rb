class CreateShops < ActiveRecord::Migration[6.0]
  def change
    create_table :shops do |t|
      t.string     :name       , null: false
      t.integer    :category_id, null: false
      t.text       :address    , null: false
      t.text       :explain    , null: false
      t.references :user       , foreign_key: true
      t.timestamps
    end
  end
end
