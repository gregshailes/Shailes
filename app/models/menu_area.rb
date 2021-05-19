class MenuArea < ApplicationRecord

  has_many :menus

  def self.home
    self.where(description: 'Personal').first
  end

  def self.work
    where(description: 'Work').first
  end

end