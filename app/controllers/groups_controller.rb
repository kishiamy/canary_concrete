class GroupsController < InheritedResources::Base
  before_filter :is_admin
end
