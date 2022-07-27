class CreatePersonnels < ActiveRecord::Migration[6.1]
  def change
    create_table :personnels do |t|
      t.string :name
      t.string :surname
      t.string :maintenance_unit
      t.string :position

      t.timestamps
    end
  end
end
