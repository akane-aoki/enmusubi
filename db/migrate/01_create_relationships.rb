class CreateRelationships < ActiveRecord::Migration[7.0]
  def change
    create_table :relationships do |t|

      t.timestamps
    end
  end
end
