class ArticlesController < ApplicationController

  # set the article object before each of these for use
  before_action :set_article, only: [:show, :edit, :update, :destroy, :email_article]

  before_action :authenticate_admin, except: [:index, :show]

  #doesn't work unless i create an admin table..
  #before_action :authenticate_admin!, except: [:index, :show]

  def authenticate_admin
    authenticate_user!
    if(current_user.try(:admin?))
      return
    else
      redirect_to root_url
    end
  end


  def email_article

    User.where( :send_newsletter => true).each do |user|
      # calling the mailer
      UserMailer.sent_article_to_user(@article, user).deliver_now
    end

    #UserMailer.sent_article_email(@article).deliver_now
    redirect_to @article, notice: 'Article was emailed successfully.'

  end


  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.order(created_at: :desc).page(params[:page])
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save

        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
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
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :author, :published_date, :published, :content, :avatarurl)
    end
end
