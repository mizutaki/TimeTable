require 'prawn'

f_name = File.basename(__FILE__,".rb")+".pdf"
Prawn::Document.generate(f_name) {
  stroke_axis
  stroke_circle [0,0] , 10 #原点

  text "Hello,World!!!"
  #text "こんにちわ、世界！！！"

  bounding_box([100,300],:width=>100,:height=>300) {
    stroke_bounds
    stroke_circle [10,300] , 10 #原点

  }
}
