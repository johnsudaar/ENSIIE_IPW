require 'rubygems'
require 'sinatra'
require 'haml'

get '/' do
  @articles = Array.new
  index = 0
  files = Dir.glob("articles/*.txt").sort.reverse
  files.each do |file|
    #line_num = 0
    content = ""
    title=""
    File.foreach(file).with_index do |line, line_num|
      if line_num == 0
        title = line
      else
        if line_num != 1
          content += "<br/>"
        end
        content += line
      end
    end
    puts file
    @articles[index] = {"title"=> title, "message"=>content}
    index = index+1
  end
  haml :index
end
