class CreateRemarks < ActiveRecord::Migration[6.1]
  def change
    create_table :remarks do |t|
      t.references :job, null: false, index: true
      t.text :remarks
      t.timestamps
    end
  end
end
