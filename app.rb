require 'sinatra'
require 'sinatra/base'
require 'sinatra/reloader'
require 'prawn'
require 'prawn/table'
require 'json'

class MainApp < Sinatra::Base
  set :public, File.dirname(__FILE__) + '/public'

  get '/' do
    erb :index
  end

  get '/download_pdf/:file_name' do
    response.headers["Content-Disposition"] = "attachment"
    file_name = params['file_name']
    file_path = "public/images/#{file_name}"
    send_file file_path
  end

  post '/output_pdf' do
    timetable = []
    timetable_dayofweek = ["","Mon","Tues","Wed","Thur","Fri"]
    timetable << timetable_dayofweek
    records = JSON.parse(params[:records])
    records.each_with_index do |record,idx|
      idx+=1
      record.unshift(idx.to_s)
      timetable << record
    end
    file_name = File.basename(__FILE__,".rb")+".pdf"
    file_path = "public/images/#{file_name}"
    Prawn::Document.generate(file_path) {
      stroke_axis
      font "vender/fonts/ipaexg.ttf"
      text "TimeTable"
      bounding_box([150,650],:width=>300,:height=>300) {
        table timetable
      }
    }
    file_name
  end
end
