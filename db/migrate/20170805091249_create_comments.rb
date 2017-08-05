class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :username
      t.text :content
      t.belongs_to :commentable, polymorphic: true
      t.timestamps
    end
  add_index :comments, [:commentable_id, :commentable_type]
  end
end
