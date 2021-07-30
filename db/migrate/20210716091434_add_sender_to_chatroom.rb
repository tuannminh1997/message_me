class AddSenderToChatroom < ActiveRecord::Migration[6.1]
  def change
    add_column :chatrooms, :sender, :string
  end
end
