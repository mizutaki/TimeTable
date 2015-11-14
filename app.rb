require 'sinatra'
require 'sinatra/base'
require 'sinatra/reloader'
require 'prawn'
require 'prawn/table'
require 'json'
require 'csv'

class MainApp < Sinatra::Base
  set :public, File.dirname(__FILE__) + '/public'

  get '/' do
    erb :index
  end

  get '/download/:file_name' do
    response.headers["Content-Disposition"] = "attachment"
    file_name = params['file_name']
    file_path = "public/images/#{file_name}"
    send_file file_path
  end

  post '/output_pdf' do
    timetable = []
    timetable_dayofweek = ["","Mon","Tue","Wed","Thu","Fri"]
    timetable << timetable_dayofweek
    records = JSON.parse(params[:records])
    records.each_with_index do |record,idx|
      idx+=1
      record.unshift(idx.to_s)
      timetable << record
    end
    file_name = File.basename(__FILE__,".rb")+".pdf"
    file_path = "public/images/#{file_name}"
    Prawn::Document.generate(file_path) do |pdf|
      pdf.stroke_axis
      pdf.font "vender/fonts/ipaexg.ttf"
      pdf.font_size(40)
      pdf.text "TimeTable"
      pdf.bounding_box([40,550],:width=>550,:height=>700) {
        pdf.table timetable
      }
    end
    file_name
  end

  post '/output_backupfile' do
    file_name = "bk.csv"
    CSV.open("public/imagqes/#{file_name}", "w") do |w|
      records = JSON.parse(params[:records])
      records.each do |record|
        w << record
      end
    end
    file_name
  end
end
