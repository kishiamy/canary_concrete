class Page < ActiveRecord::Base
  has_many :pages
  belongs_to :page
  has_many :translations
  accepts_nested_attributes_for :translations
  translates :title, :content
  scope :roots, where(page_id: nil)

  validate :page_move_to_correct_location, :on => :update
  validate :page_name
  
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

  def parents
    parent = self.page
    parents = [ ]
    while parent.present?
      parents << parent
      parent = parent.page
    end
    parents
  end

  def page_move_to_correct_location
    if page.present?
      if page.parents.include?(self)
        errors[:Page] << ("Page don't can move to own branch")
      end
    end
  end
  
  def page_name
    if self.page == nil
      validates_length_of :title, :maximum => 11 
    end
  end
end
