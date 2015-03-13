class ListsController < ApplicationController
  def index
    @lists = List.all
    render :index
  end

  def new
    @list = List.new
    render :new
  end

  def create
    @list = List.new(params[:list])
    if @list.save
      flash[:notice] = "List successfully added!"
      redirect_to lists_path
    else
      render :new
    end
  end

  def show
    @list = List.find(params[:id])
    render :show
  end

  def edit
    @list = List.find(params[:id])
    render :edit
  end

  def update
    @list = List.find(params[:id])
    if @list.update(params[:list])
      flash[:notice] = "List successfully updated!"
      redirect_to lists_path
    else
      render :edit
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to lists_path
    flash[:notice] = "List successfully deleted!"
  end


end
