class Product < ApplicationRecord
  #Associations
  belongs_to :product_type

  #Enum
  enum status: {expired:0, expiring:1, usual:2}

  #validations

  #Methods
  def self.search(search)
    if search
      where(["name LIKE ?", "%#{search}%"])
    else
      all
    end
  end
  
end
