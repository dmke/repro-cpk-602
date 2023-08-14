class HouseOwnerBilling < ApplicationRecord
  belongs_to :inquiry
  belongs_to :owner

  belongs_to :house_inquiry,
    foreign_key: :inquiry_id,
    primary_key: :inquiry_id,
    inverse_of:  :house_owner_billing
end
