class CreatePositions < ActiveRecord::Migration[5.1]
  def change
    create_table :positions do |t|
      t.string  :title,     allow_null: false
      t.string  :employer,  allow_null: false
      t.string  :location
      t.string  :source
      t.integer :status,    allow_null: false, default: 0
      t.string  :url

      t.timestamps
    end
  end
end
