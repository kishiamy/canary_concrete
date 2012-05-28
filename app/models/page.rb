class Page < ActiveRecord::Base
  has_many :pages
  belongs_to :page

  scope :roots, where(page_id: nil)
end
