class ArticlesController < ApplicationController

    def index
        @articles = Article.all 
    end
    
    
    def show
        # byebug
        @article = Article.find(params[:id])
        
    end

    def new
    end

    def create
        @article = Article.new(params.require(:article).permit(:title, :description))
        puts @article.inspect # Debugging line to check the article object
        if @article.save
          render plain: @article # Render @article if it saves successfully
        else
          render plain: "Error saving article" # Handle errors
        end
    end


end