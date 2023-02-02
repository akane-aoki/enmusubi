class CreateEfforts < ActiveRecord::Migration[7.0]
  def change
    create_table :efforts do |t|
      t.string :body, null: false
      t.references :user, null: false, index: { unique: true },foreign_key: true

      t.timestamps
    end
  end
end
