class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
    # カラムを追加
      t.string :title
      t.string :body
      t.timestamps
    end
  end
end
