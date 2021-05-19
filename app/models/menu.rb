class Menu < ApplicationRecord

  has_many :menu_items

  belongs_to :menu_area
  has_many :menu_items

end