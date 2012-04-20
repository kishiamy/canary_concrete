class Page < ActiveRecord::Base
  has_many :pages
  belongs_to :page

  def family
    components = []
    if self.pages
      self.pages.each_with_index do |child, index|
        components[index] = child
        components[index][:childs]= child.family
      end
    end
  end
  def self.tree
    tree=[]
    Page.where(:page_id=>nil).each_with_index do |bastard, index|
      tree[index] = bastard
      tree[index][:childs]= bastard.family
    end
  end
end
