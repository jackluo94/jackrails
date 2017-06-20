class Product < ApplicationRecord

  has_many :reviews

  validates_presence_of :name, message: "must be fill in."
  validates_numericality_of :price, :qty_on_hand, :cost, :shipping_weight, message: "is NOT AN ACCEPTABLE number."

  validates :description, length: { maximum: 500 }

  #comment out for now.
  #validates :name, uniqueness: true

  validates_format_of :thumbnail, :full_size, :with => /https?:\/\/[\S]+/, message: "must be http://- or https://-"

  #kool but price is already converted to an float/validated by numericality
  #validates_format_of :price, :with => /\A\d*\.?\d*\z/


  ##custom validation
  #validate :name_ingredients_not_same
  #def name_ingredients_not_same
  #  if name == ingredients
  #    error.add(:ingredients, "can't be the same as name")
  #  end
  #end


  paginates_per 10

end
