class Owner < ApplicationRecord
  has_many :houses,
    inverse_of: :owner
end
