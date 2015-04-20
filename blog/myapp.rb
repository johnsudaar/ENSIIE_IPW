require 'rubygems'
require 'sinatra'
require 'haml'

get '/' do
  articles = Array.new
  index = 0
  files = Dir.glob("articles/*.txt").sort.reverse
  files.each do |file|
    line_num = 0
    content = ""
    title=""
    text=File.open(file).read
    text.gsub!(/\r\n?/, "\n")
    text.each_line do |line|
      if line_num == 0
        title = line
      else
        if line_num != 1
          content += "<br/>"
        end
        content += line
      end
      line_num += 1
    end
    puts file
    articles[index] = {"title"=> title, "message"=>content}
    index = index+1
  end
  puts articles
  haml :index
end
