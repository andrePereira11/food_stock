class Product < ApplicationRecord
  before_save :default_values

  #Associations
  belongs_to :product_type

  #Enum
  enum status: {expired:0, expiring:1, usual:2}

  #validations
  validates :name, presence: true
  validates :validate_date, presence: true
  validates :code, uniqueness: true, presence: true    #{ case_sensitive: false } fara com que não possa ter code A2 e a2
  validates :price, numericality: true, if: Proc.new{|u| u.price.present?}
  validates :weight, numericality: true, if: Proc.new{|u| u.weight.present?}
  validates :quantity, numericality: { only_integer: true }, if: Proc.new{|u| u.quantity.present?}
  validate :expiration_date_cannot_be_in_the_past

  #Methods

  #Método que verifica se tem uma pesquisa ou envia todos os produtos (all)
  def self.search(search)
    if search
      where(["name LIKE ?", "%#{search}%"])
    else
      all
    end
  end

  #Método que valida se a data de validade é inferior a data de cadastro
  def expiration_date_cannot_be_in_the_past
    if validate_date.present? && validate_date < Date.today
      errors.add(:validate_date, "can't be in the past")
    end
  end

  #metodo para deixar price, weight e quantity por default 0 se vierem campos ''
  def default_values
    self.price ||= 0 # note self.code = 0 if self.code.nil? might be safer (per @frontendbeauty)
    self.weight ||= 0
    self.quantity ||= 1
    #self.price = 0 if self.price = ''
  end
end
