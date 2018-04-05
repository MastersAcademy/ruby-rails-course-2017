class AddAttachmentsToArticle < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :attachments, :json
  end
end
