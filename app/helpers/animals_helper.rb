module AnimalsHelper
  def age_in_years(birthday)
    now = Time.now.utc.to_date
    now.year - birthday.year - (birthday.to_date.change(year: now.year) > now ? 1 : 0)
  end

  def age_in_months(birthday)
    now = Time.now.utc.to_date
    difference_in_days = now - birthday
    (difference_in_days / 30).round
  end
end
