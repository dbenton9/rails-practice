class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :comment
      t.timestamps
    end

    # ALTER TABLE "posts" ADD "oldcomment" text[]
    add_column(:posts, :oldcomment, :text, array: true)
  end
end
