class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.references  :position,    foreign_key: true
      t.string      :description, allow_null: false
      t.date        :event_on,    allow_null: false

      t.timestamps
    end
  end
end
