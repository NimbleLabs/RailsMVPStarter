# == Schema Information
#
# Table name: coupon_codes
#
#  id         :bigint           not null, primary key
#  code       :string
#  offer      :string
#  user_id    :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class CouponCode < ApplicationRecord
  belongs_to :user, optional: true

  validates_uniqueness_of :code

  def already_used?
    user_id.present?
  end

  def redeem(user)
    update(user_id: user.id)
  end

  def self.to_csv
    headers = %w{code}
    CSV.generate(headers: true) do |csv|
      csv << headers

      all.each do |coupon|
        csv << [coupon.code]
      end
    end
  end

  def self.customer?(user)
    CouponCode.where(user_id: user.id).first.present?
  end
end
