require 'test_helper'

class HouseOwnerBillingTest < ActiveSupport::TestCase
  test "can be built from associations" do
    owner = Owner.create! name: "John Doe"
    house = owner.houses.create! name: "The Restaurant at the End of the Universe"

    inquiry       = Inquiry.create!
    house_inquiry = inquiry.create_house_inquiry house: house
    house_billing = house_inquiry.create_house_owner_billing! owner: owner

    assert house_billing.persisted?
    assert house_billing.inquiry_id == inquiry.id
  end
end
