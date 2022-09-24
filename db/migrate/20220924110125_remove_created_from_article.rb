class RemoveCreatedFromArticle < ActiveRecord::Migration[7.0]
  def change
    remove_column :articles, :created, :datetime
    remove_column :articles, :edited, :datetime
  end
end
