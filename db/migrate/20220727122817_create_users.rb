class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :surname
      t.string :position
      t.string :unit
      t.string :service
      
      t.timestamps
    end
  end
end
