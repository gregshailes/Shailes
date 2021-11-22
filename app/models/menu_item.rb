class MenuItem < ApplicationRecord

  belongs_to :menu

  default_scope { order(:index) }

  def break?
    caption.nil? && url.nil?
  end
  
end