class ArticlesController < ApplicationController

    def index
        @articles = Article.all 
        render json: @articles
    end
    
    
    def show
        @articles = Article.find(params[:id])
        render json: @articles
    rescue ActiveRecord::RecordNotFound
        render json: { error: "Article not found" }, status: :not_found
    end

end