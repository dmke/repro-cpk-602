class House < ApplicationRecord
  belongs_to :owner
  has_many :house_inquiries
  has_many :inquiries,
    through: :house_inquiries
end
