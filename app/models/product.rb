class Product < ApplicationRecord
  #Associations
  belongs_to :product_type

  #Enum
  enum status: {expired:0, expiring:1, usual:2}

  #validations
  validates :name, presence: true
  validates :validate_date, presence: true
  validates :code, uniqueness: { case_sensitive: false }, presence: true    #normalmente é apenas true, mas {case_sensitive} fara com que não possa ter code A2 e a2
  validates :price, numericality: true
  validates :weight, numericality: true
  validates :quantity, numericality: { only_integer: true }
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
      errors.add(:expiration_date, "can't be in the past")
    end
  end

end
