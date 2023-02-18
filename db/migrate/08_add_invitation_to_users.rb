class AddInvitationToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :invitation_digest, :string
    add_index :users, :invitation_digest, unique: true
  end
end
