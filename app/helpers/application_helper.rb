module ApplicationHelper
  def inclination(count, one, few, many)
    return many if (count % 100).between?(11, 14)

    case count % 10
    when 1 then one
    when 2..4 then few
    else
      many
    end
  end

  def navbar_color_now
    return '#370617' unless current_user.present?

    current_user.navbar_color
  end
end
