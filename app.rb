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

  post '/output_pdf' do
    time = params['time'].to_i
    timetable = Array.new(time) { Array.new(5) }
    time.times do |t|
      timetable[t][0] = t +1
    end
    f_name = File.basename(__FILE__,".rb")+".pdf"
    Prawn::Document.generate(f_name) {
      stroke_axis
  
      text "TimeTable"
      bounding_box([150,650],:width=>300,:height=>300) {
        table timetable
      }
    }
  end
end
