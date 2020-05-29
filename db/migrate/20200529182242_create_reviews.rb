class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :author
      t.text :content_body
      t.integer :rating
      t.column(:product_id, :integer)

      t.timestamps
    end
  end
end
