class NotesController < ApplicationController

  def new
    note = Note.new
  end

  def create
    token = params[:headers][:token]
    user = User.find(Auth.decode(token)["user_id"])
    notebook_id = params[:notebook_id]
    note = Note.new(title: params[:title], body: params[:note][:body], notebook_id: notebook_id)
    if note.save
      render json: note
    end
  end

  def show
    token = request.headers["token"]
    user = User.find(Auth.decode(token)["user_id"])
    notebook = user.notebooks.find(params[:notebook_id])
    note = notebook.notes.find(params[:id])
    render json: note
  end

  def index
    notes = Note.all
    render json: notes
  end

  def edit
    note = Note.find(params[:id])
  end

  def update
    note = Note.find(params[:id])
    note.update(body: params[:note])
    render json: note
  end

  def destroy
    note = Note.find(params[:id])
    note.delete
    render json: params[:id]
  end




end
