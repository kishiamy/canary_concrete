class Devise::SessionsControllerController < DeviseController
  prepend_before_filter :require_no_authentication, :only => [ :new, :create ]
end
