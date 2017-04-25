class NotebooksController < ApplicationController

  def new
    notebook = Notebook.new
  end

  def create
    token = params[:headers][:token]
    result = Auth.decode(token)
    user = User.find(result["user_id"])
    notebook = Notebook.new(title: params[:notebook][:title], user_id: user.id)
    if notebook.save
      render json: notebook
    end
  end

  def show
    token = request.headers["token"]
    user = User.find(Auth.decode(token)["user_id"])
    notebook = user.notebooks.find(params[:id])
    render json: notebook
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
    render json: params[:id]
  end

  private

  def notebook_params
    params.require(:notebook).permit(:title, :description, :user_id)
  end


end
