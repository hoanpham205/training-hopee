class RemoveColumnPostsCountFromUsers < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :posts_count
  end
end
