class CreateFoods < ActiveRecord::Migration[6.0]
  def change
    create_table :foods do |t|
      t.string     :name,    null: false
      t.text       :explain, null: false
      t.references :user,    foreign_key: true
      t.references :shop,    foreign_key: true
      t.timestamps
    end
  end
end
