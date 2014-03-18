class AddMixcloudToUser < ActiveRecord::Migration
  def change
    add_column :users, :mixcloud_access_token, :string
  end
end
