module UserHelper
    def extract_days_from_date date
      (DateTime.now.to_date -  date.to_date).to_i
    end
end
  