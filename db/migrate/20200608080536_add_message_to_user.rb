class AddMessageToUser < ActiveRecord::Migration[5.2]
  def change
    # stringよりtextが望ましい？
    add_column :users, :message, :string
  end
end
