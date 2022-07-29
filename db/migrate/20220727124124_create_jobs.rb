class CreateJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs do |t|
      t.references :requestor, null: false, index: true, foreign_key: {to_table: :users}
      t.text :description
      t.references :assessor, null: false, index: true, foreign_key: {to_table: :personnels}
      t.references :staff, null: false, index: true, foreign_key: {to_table: :personnels}
      t.string :maintenance_unit
      t.string :status
      t.string :remarks
      t.timestamps
    end
  end
end