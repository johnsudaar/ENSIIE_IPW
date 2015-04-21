class Article
  attr_reader :title, :message, :summary

  def initialize(id)
    @message = ""
    @title = ""
    filename="articles/"+id.to_s+".txt"
    if ! File.exist?(filename)
      @title = "404"
      @message = "Not found"
      @summary = "Not found"
    else
      File.foreach(filename).with_index do | line, line_num|
        if line_num == 0
          @title=line
        else
          @message += line
        end
      end
    end # end foreach
    @summary = @message[0,70]+" ..."
    @message = @message.gsub(/(?:\n\r?|\r\n?)/, '<br>')
  end # enc initialize

  def self.getAllIds()
    data = Array.new
    files = Dir.glob("articles/*.txt").sort.reverse
    files.each do |file|
      data.push File.basename(file,".*")
    end
    return data
  end

  def self.getArticles(first,last)
    ids = Article.getAllIds()
    articles = Array.new
    first = first <= 0 ? 0 : first;
    first = first >= ids.length ? ids.length - 1 : first;
    last = last >= ids.length ? ids.length - 1 : last;
    last = last < first ? first : last;

    for i in first .. last
      articles.push Article.new ids[i]
    end
    return articles
  end
end
