class ListsController < ApplicationController
  def index
    @lists = List.all

  end

  def show
    @list = List.find(params[:id])
    @bookmark = @list.bookmarks
    @list.user = current_user

  end

  def new
    @list = List.new
    @existing_list = List.first

  end

  def create
    @list = List.new(movies_params)
    @list.user = current_user

    if @list.save
      redirect_to root_path, notice: "list was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
  end

  def movies_params
    params.require(:list).permit(:name)
  end

end
