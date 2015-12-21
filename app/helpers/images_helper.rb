module ImagesHelper
  def can_add_to_top?
    user_signed_in? && is_admin_or_vip? && category_is_not_top
  end

  def is_admin_or_vip?
    current_user.admin? || current_user.vip?
  end

  def category_is_not_top
    category.slug != 'top'
  end
end
