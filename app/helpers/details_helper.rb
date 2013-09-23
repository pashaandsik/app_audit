module DetailsHelper
  def nested_details(details)
    details.map do |detail, sub_details|
      render(detail) + content_tag(:div, nested_details(sub_details), :class => "nested_details")
    end.join
  end
end
