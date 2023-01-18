class CreateMeets < ActiveRecord::Migration[7.0]
  def change
    create_table :meets do |t|
      t.date :meet_day, null: false
      t.integer :status
      t.references :relationship, foreign_key: true

      t.timestamps
    end
  end
end
