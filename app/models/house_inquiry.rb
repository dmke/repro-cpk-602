class HouseInquiry < ApplicationRecord
  self.primary_keys = %i[inquiry_id house_id]

  belongs_to :inquiry
  belongs_to :house

  has_one :house_owner_billing,
    foreign_key: :inquiry_id,
    primary_key: :inquiry_id,
    inverse_of:  :house_inquiry
end
