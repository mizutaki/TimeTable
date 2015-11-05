require 'sinatra'
require 'sinatra/base'
require 'sinatra/reloader'
require 'prawn'
require 'prawn/table'
require 'pp'

class MainApp < Sinatra::Base
  set :public, File.dirname(__FILE__) + '/public'

  get '/' do
    erb :index
  end

  get '/output_pdf' do
    timetable = Array.new(6) { Array.new(6) }
    timetable[0][1] = "Mon"
    timetable[0][2] = "Tues"
    timetable[0][3] = "Wed"
    timetable[0][4] = "Thur"
    timetable[0][5] = "Fri"
    timetable[1][0] = 1
    timetable[2][0] = 2
    timetable[3][0] = 3
    timetable[4][0] = 4
    timetable[5][0] = 5
    file_name = File.basename(__FILE__,".rb")+".pdf"
    f_name = "public/images/#{file_name}"
    Prawn::Document.generate(f_name) {
      stroke_axis
  
      text "TimeTable"
      bounding_box([150,650],:width=>300,:height=>300) {
        table timetable
      }
    }
    response.headers["Content-Disposition"] = "attachment"
    send_file f_name
  end
end
