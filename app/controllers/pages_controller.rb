class PagesController < InheritedResources::Base
  before_filter :is_admin, except: [:index, :show] 
end
