class Gift < ActiveRecord::Base
  has_many :winners, dependent: :nullify

  scope :in_stock, -> { where('inventory != 0 and type_g != 10') }
  scope :without_blank, -> {where('type_g != 10') }
  scope :tin, -> { where(type_g: 5) }
end
