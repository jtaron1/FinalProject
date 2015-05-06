class CreateTwitterUsers < ActiveRecord::Migration
  def change
    create_table :twitter_users do |t|
      t.string :user_id
      t.string :twitter_id

      t.timestamps null: false
    end
  end
end
