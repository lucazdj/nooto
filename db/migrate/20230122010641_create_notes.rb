class CreateNotes < ActiveRecord::Migration[7.0]
  def change
    create_table :notes do |t|
      t.string :title
      t.string :content
      t.string :color
      t.references :author, null: false, foreign_key: true

      t.timestamps
    end
  end
end
