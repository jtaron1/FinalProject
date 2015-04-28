class RenameFeedUserToFeedsUser < ActiveRecord::Migration
  def change
    rename_table :feed_users, :feeds_users
  end
end
