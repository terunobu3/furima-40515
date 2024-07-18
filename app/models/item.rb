class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :category
 
  with_options presence: true do
    validates :image
    validates :name, length: {maximum: 40}
    validates :text, length: {maximum: 1000}
    validates :price, numericality: {only_integer: true, message: 'は半角で入力してください。' }
  end
  with_options numericality: { other_than: 0, message: "を選択してください" } do
    validates :prefecture_id
    validates :category_id
    validates :status_id
    validates :delivery_id
    validates :delivery_days_id
  end
  validates :price, numericality: { greateer_than_or_equal_to: 300,
              less_than_or_equal_to: 9_999_999, message: 'は範囲内に設定してください'}
end
