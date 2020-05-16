class Product < ApplicationRecord
  #Associations
  belongs_to :product_type

  #Enum
  enum product_status: [:loser, :expiring, :usual]

  #validations
end
