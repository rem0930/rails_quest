class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :description
      t.text :content
      t.string :tag_list

      t.timestamps
    end
  end
end
