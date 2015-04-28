class CreateTitles < ActiveRecord::Migration
  def change
    create_table :titles do |t|
      t.string :title
      t.string :url
      t.string :link
      t.string :summary

      t.timestamps null: false
    end
  end
end
