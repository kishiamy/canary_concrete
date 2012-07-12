class CreatePages < ActiveRecord::Migration
  def up
    create_table :pages do |t|
      t.string :title
      t.text :content
      t.integer :page_id

      t.timestamps
    end
    Page.create_translation_table! :title => :string, :content => :text
  end
  def down
    drop_table :pages
    Page.drop_translation_table!
  end
end
