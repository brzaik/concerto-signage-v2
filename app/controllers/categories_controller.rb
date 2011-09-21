class CategoriesController < ApplicationController
  respond_to :html, :xml, :json
  before_filter :authenticate_user!
  
  # GET /categories
  # GET /categories.xml
  def index
    @categories = Category.all
    respond_with(@categories)
  end

  # GET /categories/new
  # GET /categories/new.xml
  def new
    @category = Category.new
    respond_with(@category)
  end

  # GET /categories/1/edit
  def edit
    @category = Category.find(params[:id])
  end

  # POST /categories
  # POST /categories.xml
  def create
    @category = Category.new(params[:category])
    flash[:notice] = "Category successfully created" if @category.save
    redirect_to categories_path
  end

  # PUT /categories/1
  # PUT /categories/1.xml
  def update
    @category = Category.find(params[:id])
    flash[:notice] = "Category successfully updated" if @category.update_attributes(params[:category])
    redirect_to categories_path
  end

  # DELETE /categories/1
  # DELETE /categories/1.xml
  def destroy
    @category = Category.find(params[:id])
    flash[:notice] = "Category successfully deleted" if @category.destroy
    redirect_to categories_path
  end
end
