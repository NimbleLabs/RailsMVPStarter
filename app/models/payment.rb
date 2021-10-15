# == Schema Information
#
# Table name: payments
#
#  id                 :bigint           not null, primary key
#  amount             :integer
#  description        :string
#  status             :string
#  stripe_id          :string
#  stripe_customer_id :string
#  created            :integer
#  user_id            :bigint           not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
class Payment < ApplicationRecord
  belongs_to :user
end
