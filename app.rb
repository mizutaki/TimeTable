require 'sinatra'
require 'sinatra/base'
require 'sinatra/reloader'
require 'prawn'
require 'prawn/table'
require 'json'
require 'csv'
require_relative 'dayofweek'

class MainApp < Sinatra::Base
  set :public, File.dirname(__FILE__) + '/public'

  helpers do
    def get_dayofweek(font_size = 30)
      return DayOfWeek.new.shorten_en.slice(1,5).map { |m| "<font size=\'#{font_size}\'>#{m.capitalize}</font>" }
    end
  end

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
    timetable_dayofweek = get_dayofweek
    timetable_dayofweek.unshift("")
    timetable << timetable_dayofweek
    records = JSON.parse(params[:records])
    records.each_with_index do |record,idx|
      idx+=1
      record.unshift("<font size=\'30\'>" + idx.to_s + "</font>")
      timetable << record
    end

    file_name = File.basename(__FILE__,".rb")+".pdf"
    file_path = "public/images/#{file_name}"
    Prawn::Document.generate(file_path) do |pdf|
      pdf.font "vender/fonts/ipaexg.ttf"
      pdf.font_size(20)
      pdf.text "TimeTable"
      pdf.bounding_box([0,670],:width=>550,:height=>700) {
        pdf.table(timetable, :cell_style => {:inline_format => true, :width => 90, :height => 90, :align => :center, :valign => :center }) do
          vertical = cells.columns(1..records.length).rows(0)
          vertical.background_color = "3366FF"
          vertical.text_color = "FFFFFF"
          horizontal = cells.columns(0).rows(1..records.length)
          horizontal.background_color = "3366FF"
          horizontal.text_color = "FFFFFF"
        end
      }
    end
    file_name
  end

  post '/output_backupfile' do
    file_name = "bk.csv"
    CSV.open("public/images/#{file_name}", "w") do |w|
      records = JSON.parse(params[:records])
      records.each do |record|
        w << record
      end
    end
    file_name
  end
end
