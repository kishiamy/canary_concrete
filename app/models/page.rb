class Page < ActiveRecord::Base
  has_many :pages
  belongs_to :page

  def family
    if self.pages
      family_record={}
      i=1
      self.pages.each do |child|
        family_record[i]=child
        family_record[i]["hijos"]=child.family 
        i=i+1
      end
      return family_record
    end
  end
  def self.tree
    tree={}
    i=1
    Page.where(:page_id=>nil).each do |bastard|
      tree[i]=bastard
      tree[i]["hijos"]=bastard.family
      i=i+1
    end
    return tree
  end
end
