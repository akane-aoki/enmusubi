class ChangeDatatypeAddressOfUsers < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :address, :string
  end
end
