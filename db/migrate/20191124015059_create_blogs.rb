class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|
      t.text                  :title
      t.text                  :text
      t.text                  :image
      t.integer               :user_id
      t.integer               :comment_id
      t.timestamps        null: true
    end
  end
end
