class Comment < ApplicationRecord
  belongs_to :product

  validates_presence_of :rating

  def self.descending
   order(created_at: :desc)
  end
end
