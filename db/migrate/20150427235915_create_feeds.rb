class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.string :url
      t.string :name
      t.integer :feed_id
      t.timestamps null: false
    end
  end
end
