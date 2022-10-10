class Records < ActiveRecord::Migration[7.0]
  def self.up

    create_table :records do |t|
      t.column :name, :string
    end

  end

  def self.down
    drop_table :records
  end
end
