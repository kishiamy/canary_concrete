class GroupsController < InheritedResources::Base
  before_filter :is_admin
  layout 'admin'
end
