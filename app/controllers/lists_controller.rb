class ListsController < ApplicationController

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)

    if @list.save
      flash[:success] = 'Queue successfully created.'
      redirect_to "/lists"
    else
      render :new
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy_vieweds
    @list.destroy
    redirect_to "/"
  end

private

  def list_params
    params.require(:list).permit(:name)
  end
end
