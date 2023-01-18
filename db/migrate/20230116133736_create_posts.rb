class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :body, limit: 65535
      t.date :date, null: false
      t.string :image
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
