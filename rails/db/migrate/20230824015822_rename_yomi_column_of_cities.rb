class RenameYomiColumnOfCities < ActiveRecord::Migration[7.0]
  def change
    rename_column :cities, :yomi, :name_yomi
  end
end
