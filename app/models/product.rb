class Product < ActiveRecord::Base
  belongs_to :artisan
  belongs_to :user

  validates :name, presence: true
  validates :description, presence: true
  validates :cost, presence: true, numericality: {greater_than_or_equal_to: 0}
end
