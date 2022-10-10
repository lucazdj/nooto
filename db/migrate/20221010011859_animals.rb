class Animals < ActiveRecord::Migration[7.0]
  def self.up
    create_table :animals do |t|
      t.column :name, :string, :limit => 32, :null => false
      t.column :record_id, :integer
      t.column :description, :text
      t.column :created_at, :timestamp
    end
  end

  def self.down
    drop_table :animals
  end
end
