class CreatePlaces < ActiveRecord::Migration[5.1]
  def change
    create_table :places do |t|
      t.text :description
      t.string :title
      t.string :tags
      t.string :address
      t.float :latitude
      t.float :longitude
      t.boolean :espresso
      t.boolean :cappuccino
      t.boolean :latte
      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
