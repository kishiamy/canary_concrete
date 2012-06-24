class Page < ActiveRecord::Base
  has_many :pages
  belongs_to :page

  # validate :page_move_to_correct_location, :on => :update

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

  def family_include?(page)
    if page.present?
      if self.pages.include?(page)
        self.pages.include?(page)
      else
        self.pages.each do |child|
          child.family_include?(page)
        end
      end
    end
  end

  def page_move_to_correct_location
    if self.family_include?(self.page)
      errors[:page_id] << "Page don't can move to himself branch"
    end
  end

end
