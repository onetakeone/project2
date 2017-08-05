class CreatePlaces < ActiveRecord::Migration[5.1]
  def change
    create_table :places do |t|
      t.text :description
      t.string :title
      t.string :tags
      t.string :address

      t.timestamps
    end
  end
end
