class UserOrder
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postcode, :prefecture_id, :city, :block, :building, :phone_number, :token

  with_options presence: true do
    #validates :token
    validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :block
    validates :phone_number, format: { with: /\A\d{10,11}\z/,message: "is invalid. Include hyphen(-)"}
    validates :user_id
    validates :item_id
  end
    validates :prefecture_id, numericality: { other_than: 0, message: "を選択してください" }

  def save
    # 購入情報を保存
    order = Order.create(item_id: item_id, user_id: user_id)
    # 住所情報を保存
    Address.create(postcode: postcode, prefecture_id: prefecture_id, city: city, block: block,
                   building: building, phone_number: phone_number, order_id: order.id)
  end
end