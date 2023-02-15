class CreateMeets < ActiveRecord::Migration[7.0]
  def change
    create_table :meets do |t|
      t.date :meet_day_start, null: false
      t.date :meet_day_end
      t.integer :status
      t.references :relationship, null: false, foreign_key: true

      t.timestamps
    end
  end
end
