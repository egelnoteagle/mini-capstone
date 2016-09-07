class ProductsController < ApplicationController
  def index
    @records = Product.all
  end

  def show
    @record = Product.find(params[:id])
  end

  def new
    
  end

  def create
    @record = Product.create(image: params[:image],
                             artist: params[:artist],
                             album: params[:album],
                             year: params[:year],
                             genre: params[:genre],
                             weight: params[:weight],
                             price: params[:price])
    
    flash[:success] = "New Record Created" 
    redirect_to "/records/#{@record.id}"
  end

  def edit
    @record = Product.find(params[:id])
  end

  def update
    @record = Product.find(params[:id])
    @record.update(image: params[:image],
                   artist: params[:artist],
                   album: params[:album],
                   year: params[:year],
                   genre: params[:genre],
                   weight: params[:weight],
                   price: params[:price])
      
    flash[:success] = "Record Updated"
    redirect_to "/records/#{@record.id}"
  end

  def destroy
    @record = Product.find(params[:id])
    @record.destroy

    flash[:warning] = "Record Deleted"
    redirect_to '/records'
  end
end 

