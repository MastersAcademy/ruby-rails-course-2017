class ChangeArticleTitleFieldType < ActiveRecord::Migration[5.1]
  def change
    change_column :articles, :title, :string
  end
end

