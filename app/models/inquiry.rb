class Inquiry < ApplicationRecord
  has_one :house_inquiry
  has_one :house, through: :house_inquiry
end
