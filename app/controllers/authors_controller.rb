class AuthorsController < ApplicationController
  def new
  end

  def show
    @author = Author.find(params[:id])
  end

  def create
    @author = Author.new(article_params) 
    @author.save
    redirect_to @author
  end

  private
    def article_params
      params.require(:author).permit(:firstname, :lastname, :homepage)
    end
end
