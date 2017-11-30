class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.references :position, foreign_key: true

      t.string :name, allow_null: false, index: true
      t.string :email
      t.string :phone

      t.timestamps
    end

    change_table :events do |t|
      t.references :contact, foreign_key: true
    end
  end
end
