class CreatePageTranslations < ActiveRecord::Migration
  def up
    Page.create_translation_table!({
      title: :string,
      content: :text
    }, {
      migrate_data: true
    })
  end
end
