module ApplicationHelper
  def elements_in_both(first, second)
    elements = []
    first.each do |elem|
      elements.push(elem) if second.include?(elem)
    end
    elements
  end

  def pretty_datetime(datetime)
    datetime.strftime("%Y-%m-%d %H:%M")
  end

  def pretty_date(date)
    date.strftime("%Y-%m-%d")
  end
end
