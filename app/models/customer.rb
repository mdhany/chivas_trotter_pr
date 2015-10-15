class Customer < ActiveRecord::Base
  has_many :invoices, dependent: :delete_all
  has_one :winner, dependent: :delete

  validates :email, presence: true, uniqueness: true
  validates :birth, presence: true
  validates :identification, presence: true

  def self.get_customer(email)
    customer = find_by email: email
    if customer
      customer
    else
      nil
    end
  end

end
