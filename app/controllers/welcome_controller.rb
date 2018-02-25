class WelcomeController < ApplicationController
  def index
    @articles = Article.search(params[:search])
    @markdown= Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    #@markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
  end
end
