class GoodsController < ApplicationController
  def index

  end

  def new
    @good = Good.new
  end

  def create
    # @object = Object.new(params[:object])
    # if @object.save
    #   flash[:success] = "Object successfully created"
    #   redirect_to @object
    # else
    #   flash[:error] = "Something went wrong"
    #   render 'new'
    # end
  end
  

  def show
  end

  def edit
    # @ = .find()
  end
  
end
