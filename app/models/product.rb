class Product < ApplicationRecord
  has_many :comments, :dependent => :destroy

	validates_presence_of :name
	validates_numericality_of :price, :quantity, :weight, :greater_than => 0
	validates_uniqueness_of :name
	validates_length_of :name, maximum: 32
	paginates_per 5
end
