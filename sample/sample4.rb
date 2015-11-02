require 'prawn'
require 'prawn/table'

f_name = File.basename(__FILE__,".rb")+".pdf"
Prawn::Document.generate(f_name) {
  stroke_axis
  
  text "TimeTable"

  table [["","S","M"],
         ["1","-","-"],
         ["2","-","-"],
         ["3","-","-"],
         ["4","-","-"],
         ["5","-","-"],
         ["6","-","-"]]
}
