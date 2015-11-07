require 'sinatra'
require 'sinatra/base'
require 'sinatra/reloader'
require 'prawn'
require 'prawn/table'

class MainApp < Sinatra::Base
  set :public, File.dirname(__FILE__) + '/public'

  get '/' do
    erb :index
  end

  get '/output_pdf' do
    period = params[:period].to_i
    timetable = []
    timetable_dayofweek = ["","Mon","Tues","Wed","Thur","Fri"]
    timetable << timetable_dayofweek
    period.times do |pt|
      pt+=1
      timeTable_record = Array.new(timetable_dayofweek.length)
      timeTable_record[0] = pt
      timetable << timeTable_record
    end
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
