class Page < ActiveRecord::Base
  has_many :pages
  belongs_to :page
  has_many :translations
  accepts_nested_attributes_for :translations
  translates :title, :content
  scope :roots, where(page_id: nil)
end
