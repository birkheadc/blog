class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :sub_title
      t.text :content
      t.datetime :created
      t.datetime :edited
      t.string :language

      t.timestamps
    end
  end
end
