module Fluent
  class Admin::NewsController < Admin::AdminController
    # Preload model
    before_action :set_news, only: [:show, :edit, :update, :destroy]

    def index
      @news_grid = Fluent::Datagrids::NewsGrid.new(params[:datagrids_news_grid]) do |scope|
        scope.page(params[:page])
      end

      respond_to do |format|
        if request.xhr? && !request.wiselinks?
          format.html{render partial: 'grid'}
        else
          format.html # index.html.erb
          format.json {render json: News}
        end
      end
    end

    def show
    end

    def new
      @news = News.new
    end

    def edit
    end

    def create
      @news = News.new(news_params)
      @news.author = current_user

      respond_to do |format|
        if @news.save
          format.html { redirect_to admin_news_index_url, notice: 'news was successfully created.' }
          format.json { render action: 'show', status: :created, location: @news }
        else
          format.html { render action: 'new' }
          format.json { render json: @news.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      @news.updater = current_user
      respond_to do |format|
        if @news.update(news_params)
          format.html { redirect_to admin_news_index_url, notice: 'news was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @news.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @news.destroy
      respond_to do |format|
        format.html { redirect_to admin_news_index_url }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_news
        @news = News.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def news_params
        params.require(:news).permit(:title, :preview, :content, :status)
      end
  end
end
