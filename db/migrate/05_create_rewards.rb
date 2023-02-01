class CreateRewards < ActiveRecord::Migration[7.0]
  def change
    create_table :rewards do |t|
      t.integer :not_meet_day, null: false
      t.string :content, null: false, unique: true
      t.references :relationship, null: false, foreign_key: true

      t.timestamps
    end
  end
end
