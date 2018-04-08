class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.text :title
      t.text :short_description
      t.text :description
      t.boolean :event_review
      t.boolean :show_on_site
      t.boolean :show_on_main_page
      t.timestamps
    end
  end
end
