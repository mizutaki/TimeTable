require 'prawn'

f_name = File.basename(__FILE__,".rb")+".pdf"
Prawn::Document.generate(f_name) {
}
