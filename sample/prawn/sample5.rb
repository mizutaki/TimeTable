require 'prawn'
require 'prawn/table'

f_name = File.basename(__FILE__,".rb")+".pdf"
Prawn::Document.generate(f_name) {
  stroke_axis
  
  text "TimeTable"
bounding_box([150,650],:width=>300,:height=>300) {
	table [["","S","M"],
         ["1","-","-"],
         ["2","-","-"],
         ["3","-","-"],
         ["4","-","-"],
         ["5","-","-"],
         ["6","-","-"]]
  }
}