module ApplicationHelper

  # ソート用のアイコン表示
  def sort(column)
    if request.fullpath.include?("#{column}+asc")
      tag.i class: 'fa-solid fa-sort-up'
    elsif request.fullpath.include?("#{column}+desc")
      tag.i class: 'fa-solid fa-sort-down'
    else
      tag.i class: 'fa-solid fa-sort'
    end
  end

  # 管理者権限の確認
  def admin?
    current_user.role == "システム管理者" || current_user.role == "運用管理者" ? true : false
  end

end
