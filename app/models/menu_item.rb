class MenuItem < ApplicationRecord

  belongs_to :menu

  def break?
    caption.nil? && url.nil?
  end
  
end