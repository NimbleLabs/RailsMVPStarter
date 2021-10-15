# == Schema Information
#
# Table name: credit_cards
#
#  id         :bigint           not null, primary key
#  last4      :string
#  brand      :string
#  exp_month  :integer
#  exp_year   :integer
#  country    :string
#  stripe_id  :string
#  user_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class CreditCard < ApplicationRecord
  belongs_to :user
end
