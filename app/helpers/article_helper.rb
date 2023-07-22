module ArticleHelper
  def extract_hours_from_date date
    ((DateTime.now.to_time -  date.to_time) /1.hours).to_i
  end
end
