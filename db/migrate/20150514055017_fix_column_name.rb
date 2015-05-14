class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :titles, :link, :published
  end
end
