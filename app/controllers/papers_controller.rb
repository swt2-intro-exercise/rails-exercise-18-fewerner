class PapersController < ApplicationController
  before_action :set_paper, only: [:show, :edit, :update, :destroy]
  
  def new
    @paper = Paper.new
  end

  def index
    @papers = Paper.all
    @papers = @papers.year(params[:year]) if params[:year].present?
  end

  def show
    @paper = Paper.find(params[:id])
  end

  def edit
    @paper = Paper.find(params[:id])
  end

  # POST /papers
  def create
    @paper = Paper.new(paper_params) 
    if @paper.save
      redirect_to @paper
    else
      render 'new'
    end
  end

  # PATCH/PUT /papers/1
  def update
    @paper = Paper.find(params[:id])
   
    if @paper.update(paper_params)
      redirect_to @paper
    else
      render 'edit'
    end
  end

  # DELETE /papers/1
  def destroy
    @paper = Paper.find(params[:id])
    @paper.destroy
   
    redirect_to papers_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_paper
      @paper = Paper.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def paper_params
      params.require(:paper).permit(:title, :venue, :year, :author_ids => [])
    end
end
