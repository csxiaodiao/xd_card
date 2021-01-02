module ApplicationHelper
  def controller_path_action_name
    "#{controller.controller_path.gsub('/', '__')}__#{controller.action_name}"
  end

  def html_body_classes
    "#{controller_path_action_name} #{@body_classes&.join(' ')}"
  end
end
