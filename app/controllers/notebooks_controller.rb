class NotebooksController < ApplicationController

  def new
    @notebook = Notebook.new
  end

  def create
    @notebook = Notebook.new(notebook_params)
      if @notebook.save
        redirect_to notebooks_path
      else
        render :new
    end
  end

  def show
    @notebook = Notebook.find(params[:id])
    render json: @notebook
  end

  def index
    @notebooks = Notebook.all
    render json: @notebooks
  end

  def edit
    @notebook = Notebook.find(params[:id])
  end

  def update
    @notebook = Notebook.find(params[:id])
    @notebook.update(notebook_params)
    redirect_to @notebook
  end

  def destroy
    @notebook = Notebook.find(params[:id])
    @notebook.delete
    redirect_to notebooks_path
  end

  private

  def notebook_params
    params.require(:notebook).permit(:title, :description, :user_id)
  end


end
