class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  protect_from_forgery with: :exception
  include SessionsHelper
  
  before_action :require_login,only:[:new,:create,:edit,:destroy]

  def require_login
    unless logged_in?
      redirect_to login_path(:url=>"/articles/new")
    end
  end
  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.search(params[:search])
    @markdown= Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    byebug
    @author = User.find(article.users_id)
    #@markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
   @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
 end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  def delete
  end

  # POST /articles
  # POST /articles.json
  def create
    #@article = Article.new(article_params)
    @user=User.find(current_user.id)
    @article=@user.articles.create(article_params)
    #@article.users_id=@user.id

    redirect_to root_path
    # respond_to do |format|
    #   if @article.save
    #     format.html { redirect_to @article, notice: 'Article was successfully created.' }
    #     format.json { render :show, status: :created, location: @article }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @article.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Article was successfully destroyed.' }
      # format.json { head :no_content }
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
      @author = User.find(@article.user_id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :body)
    end
  end
