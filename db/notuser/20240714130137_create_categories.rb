class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string        :title        , null: false
      t.text          :text         , null: false
      t.integer       :category_id  , null: false
      t.timestamps
    end
  end
end
