class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string  :login,            allow_null: false, index: true
      t.string  :password_digest,  allow_null:false
      t.timestamps
    end
  end
end
