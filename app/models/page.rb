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

  def search_in_family(relative)
    self.family.each do |relation|
      if relation == relative
        return true
      else
        if relation.search_in_family(relative) != true
          return false
        else
          return true
        end
      end
    end 
  end
end
