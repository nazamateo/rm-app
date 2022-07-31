class CreateJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs do |t|
      t.references :user, null: false, index: true
      t.text :nature_of_request
      t.text :note_to_staff
      t.references :assessor, index: true, foreign_key: {to_table: :personnels}
      t.references :staff, index: true, foreign_key: {to_table: :personnels}
      t.string :maintenance_unit
      t.string :status, default: 'Queue'
      t.datetime :closed_at
      t.timestamps
    end
  end
end