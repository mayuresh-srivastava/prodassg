module ApplicationHelper
	def is_admin?
    return current_user.try(:is_admin?)
  end

  def stars num_stars
    return ((image_tag "star 1.gif") * num_stars).html_safe
  end
end
