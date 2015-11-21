class DayOfWeek
  attr_reader :week_en, :week_ja
  def initialize
    @week_en = { sun: "sunday", mon: "monday", tue: "tuesday", wed: "wednesday",
                 thu: "thursday", fri: "friday", sat: "saturday" }
    @week_ja = { sun: "日曜日", mon: "月曜日", tue: "火曜日", wed: "水曜日",
                 thu: "木曜日", fri: "金曜日", sat: "土曜日" }
  end

  def shorten_en
    @week_en.keys.map {|w| w.to_s}
  end

  def lengthen_en
    @week_en.values
  end

  def shorten_ja
    @week_ja.values.map {|v| v[0]}
  end

  def lengthen_ja
    @week_ja.values
  end
end