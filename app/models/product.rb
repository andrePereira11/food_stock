class Product < ApplicationRecord
  #Associations
  belongs_to :product_type

  #Enum
  enum status: {expired:0, expiring:1, usual:2}

  #validations
  #validates :start_date,
  #date: { after: Proc.new { Date.today }, message: 'must be after today' },
  #on: :create


  #validates_date_of :validate_date, after: Proc.new { Time.now }
end
