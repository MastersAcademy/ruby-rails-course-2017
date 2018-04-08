class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :token
      t.string :uid
      t.string :avatar

      t.timestamps null: false
    end
  end
end
