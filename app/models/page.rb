class Page < ActiveRecord::Base
  has_many :pages
  belongs_to :page
  translates :title, :content
  scope :roots, where(page_id: nil)
end
