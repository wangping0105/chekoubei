module ApplicationHelper
  include SessionsHelper

  def active_by(_controller_name)
    controller_name==_controller_name ? 'active' : ''
  end
end
