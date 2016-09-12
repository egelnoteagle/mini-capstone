class ProductsController < ApplicationController
  def index
    @records = Product.all
    sort_attribute = params[:sort]
    sort_order = params[:sort_order]
    discout_level = params[:discount]
    search_term = params[:search_term]

    if search_term
      fuzzy_search_term = "%#{search_term}%"
      @records = @records.where("artist ILIKE ? OR album ILIKE ?", fuzzy_search_term, fuzzy_search_term)
    end

    if discout_level
      @records = @records.where("price < ?", discout_level)
    end  

    if sort_attribute && sort_order
      @records = @records.order(sort_attribute => sort_order)
    elsif sort_attribute
      @records = @records.order(sort_attribute)
    end  
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

  def random
    random_product = Product.all.sample
    redirect_to "/records/#{random_product.id}"
  end
end 

