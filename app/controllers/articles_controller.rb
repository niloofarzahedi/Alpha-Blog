class ArticlesController < ApplicationController

    def index
        @articles = Article.all 
    end
    
    before_action :authenticate_user!
    def show
        # byebug
        @article = Article.find(params[:id])
        
    end

    def new
        @article = Article.new # Initialize a new article object
    end

    def create
        @article = Article.new(params.require(:article).permit(:title, :description))
        puts @article.inspect # Debugging line to check the article object
        if @article.save
          flash[:notice] = "Article was successfully created." # Set a flash message
          redirect_to @article # Redirect to the show page of the article
        else
          render :new # Render the new template again if save fails
        end
    end

    def edit
        @article = Article.find(params[:id])
    end

    def update
        @article = Article.find(params[:id])
        if @article.update(params.require(:article).permit(:title, :description))
          flash[:notice] = "Article was successfully updated."
          redirect_to @article
        else
          render :edit
        end
    end


end