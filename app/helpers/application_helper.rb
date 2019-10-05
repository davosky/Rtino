module ApplicationHelper
  def admin?
    current_user.user_type == 'admin'
  end
end
