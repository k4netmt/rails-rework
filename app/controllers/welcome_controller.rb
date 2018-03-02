class WelcomeController < ApplicationController
	helper_method :count

  def index
    @articles = Article.search(params[:search])
    @markdown= Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    #@markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
  end

  def count
  	@abc='hello'
  end
end
