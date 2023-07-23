class ArticlesController < ApplicationController
    before_action :get_article, only: [:edit, :update, :show, :destroy]
    def index
        @articles = Article.paginate(page: params[:page], per_page: 5)
    end

    def show
    end

    def new
        @article =  Article.new
    end


    def create 
        @article = Article.new(article_params);
        @article.user = current_user

        if @article.save
            flash[:notice] = "Article was created succesfully"
            redirect_to @article
        else
            render :new,  status: :unprocessable_entity
        end
    end


    def edit 
    end

    def update 
        if @article.update(article_params)
            redirect_to @article
        else
            flash[:notice] =  "article could not be updated"
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy 
        if @article.destroy
            redirect_to articles_path
        else
            notice "article could not be deleted"
            redirect_to article_path
        end
        
    end

    private
    
    def get_article 
        @article = Article.find(params[:id])
    end

    def article_params
        params.require(:article).permit(:title, :description)
    end

end