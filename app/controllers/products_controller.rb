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
    render 'show.html.erb'
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
      
    render 'show.html.erb'
  end
end 

