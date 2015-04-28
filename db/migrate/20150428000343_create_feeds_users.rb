class CreateFeedsUsers < ActiveRecord::Migration
  def change
    create_table :feeds_users do |t|
      t.integer :feed_id
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
