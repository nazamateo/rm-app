class CreateEvaluations < ActiveRecord::Migration[6.1]
  def change
    create_table :evaluations do |t|
      t.references :job, null: false, index: true
      t.integer :response_time
      t.integer :quality
      t.integer :courtesy
      t.text :comments
      t.timestamps
    end
  end
end


#follow rating scheme of j.o. 