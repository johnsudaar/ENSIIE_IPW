require 'rubygems'
require 'sinatra'
require 'haml'
require_relative 'article'


get '/' do
  @page_size = 3

  if params["page"] == nil
    @num_page = 1
  else
    @num_page = params["page"].to_i
  end

  @last_page = Article.getAllIds().length.to_f / 3.0
  @last_page = @last_page.ceil

  @articles = Article.getArticles((@num_page-1)*@page_size,@num_page*@page_size - 1);

  haml :index
end

get '/article/:id' do |id|
  @article = Article.new id
  haml :article
end
