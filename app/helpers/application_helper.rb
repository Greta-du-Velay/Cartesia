module ApplicationHelper
  def percent_colorize value
    "<span style=\"font-weight: bold; color: ##{COLOR_LEVELS[((COLOR_LEVELS.count-1)*value/100).to_i].to_i.to_s(16)}\">#{value} %</span>".html_safe
  end

  def guest?
    !session[:guest_report_company].nil?
  end

end
