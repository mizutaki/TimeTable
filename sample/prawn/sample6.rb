require 'prawn'
require 'prawn/table'
require 'pry'
f_name = File.basename(__FILE__,".rb")+".pdf"
Prawn::Document.generate(f_name) {
  stroke_axis
  
text "TimeTable"
bounding_box([150,650],:width=>300,:height=>300) {
	data = [["","Mon","Thu","Wed","The","Fri"],["1","4","5","6","7","8"],["2","9","10","11","12","13"]]
  table(data) do
    values = cells.columns(1).rows(0)
    values.background_color = "FFCCFF"
    values.text_color = "FFFFFF"
    values = cells.columns(2).rows(0)
    values.background_color = "FF99FF"
    values.text_color = "FFFFFF"
    values = cells.columns(3).rows(0)
    values.background_color = "FF66FF"
    values.text_color = "FFFFFF"
    values = cells.columns(4).rows(0)
    values.background_color = "FF33FF"
    values.text_color = "FFFFFF"
    values = cells.columns(5).rows(0)
    values.background_color = "FF00FF"
    values.text_color = "FFFFFF"
    values2 = cells.columns(0).rows(1)
    values2.background_color = "FFFFCC"
    values2.text_color = "FFFFFF"
    values2 = cells.columns(0).rows(2)
    values2.background_color = "FFFF99"
    values2.text_color = "FFFFFF"
    values2 = cells.columns(0).rows(3)
    values2.background_color = "FFFF66"
    values2.text_color = "FFFFFF"
  end
}
}