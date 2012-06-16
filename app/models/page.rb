class Page < ActiveRecord::Base
  has_many :pages
  belongs_to :page

  def family
    components = []
    if self.pages
      self.pages.each_with_index do |child, index|
        components[index] = child
        components[index][:children]= child.family
      end
    end
  end
  def self.tree
    tree=[]
    Page.where(:page_id=>nil).each_with_index do |bastard, index|
      tree[index] = bastard
      tree[index][:children]= bastard.family
    end
  end

  # def child_father_permutation
  #   if 
  #   end
  # end
  def is_descendant_of?(other_page)
    return false unless other_page
    self == other_page or self.is_descendant_of? other_page
  end

  def is_ancestor_of?(other_page)
    other_page.is_descendant_of? self
  end
end
