class AddArticleIdToComments < ActiveRecord::Migration[7.1]
  def change
    add_column :comments, :article_id, :integer
  end
end
