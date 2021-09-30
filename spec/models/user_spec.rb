require 'rails_helper'

RSpec.describe User, type: :model do

  context "saving a User should behave correctly" do
    it "does not save without required data" do
      user = User.new
      user.save
      expect(user.errors.any?).to eq true
      expect(user.errors.to_a.length).to eq 3
      expect(user.id.nil?).to eq true
    end
  end

end
