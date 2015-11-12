require 'pdf/reader'

reader = PDF::Reader.new("app.pdf")
reader.pages.each do |page|
  puts page.text.class
end