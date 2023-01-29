class CreateEfforts < ActiveRecord::Migration[7.0]
  def change
    create_table :efforts do |t|
      t.string :body, null: false, unique: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
