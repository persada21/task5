class ArticlesController < ApplicationController
  def index

    
    
     @articles = Article.order( :id ).page(params[:page]).per(5)
     
    
     
     end

  def new

    @article = Article.new

  end
  
  

  def show
        @article=Article.find(params[:id])
        @comments=@article.comments
        @comment=@article.comments.build
        

   end  
def import
  Article.import(params[:file])
  redirect_to root_url, notice: "Products imported."
end  

  def edit

      @article = Article.find_by_id(params[:id])

  end

  def update

    @article = Article.find_by_id(params[:id]).comments.first.update(content: "edited comment")
    if @article.update(params_article)
      flash[:notice] = "SuccessUpdate Records"
      redirect_to action: 'index'

    else

      flash[:error] = "data not valid"
      render 'edit'
    end

  end
      def import
        Article.import(params[:file])
        redirect_to 'index', notice: "Article imported."
  end
   def create
    	 
     @article = Article.new(params_article)

    if @article.save

        flash[:notice] = "Success Add Records"

        redirect_to action: 'index'

    else

        flash[:error] = "data not valid"

        render 'new'
      end
    end
    def destroy
        Article.first.destroy
      @article =Article.find_by_id(params[:id])
      if @article.destroy
        flash[:notice] = "Success Delete a Records"
        redirect_to action: 'index'
      else
        flash[:error] = "fails Delete a Records"
        redirect_to action: 'index'
      end
    end
   
	
private
	def params_article

    params.require(:article).permit(:title,:content,:status)

	end
end
