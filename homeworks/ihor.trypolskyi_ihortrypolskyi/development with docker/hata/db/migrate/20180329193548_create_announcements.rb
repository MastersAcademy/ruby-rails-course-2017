class CreateAnnouncements < ActiveRecord::Migration[5.1]
  def change
    create_table :announcements do |t|
      t.string :link
      t.boolean :show_on_site
      t.boolean :show_on_main_page

      t.timestamps
    end
  end
end
