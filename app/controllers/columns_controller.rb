class ColumnsController < ApplicationController
  respond_to :html, :xml, :json
  before_filter :authenticate_user!
  
  # GET /columns
  # GET /columns.xml
  def index
    @columns = Column.all
    respond_with(@columns)
  end

  # GET /columns/new
  # GET /columns/new.xml
  def new
    @page = Page.find(params[:page_id]) 
    @column = @page.columns.new
    respond_with(@page)
  end

  # GET /columns/1/edit
  def edit
    @column = Column.find(params[:id])
  end

  # POST /columns
  # POST /columns.xml
  def create
    @page = Page.find(params[:page_id])
    @column = @page.columns.new(params[:column])
    flash[:notice] = "Column successfully created" if @column.save
    respond_with(@page)
  end

  # PUT /columns/1
  # PUT /columns/1.xml
  def update
    @column = Column.find(params[:id])
    flash[:notice] = "Column successfully created" if @column.update_attributes(params[:column])
    @page = @column.page
    respond_with(@page)
  end

  # DELETE /columns/1
  # DELETE /columns/1.xml
  def destroy
    @column = Column.find(params[:id])
    @page = @column.page
    flash[:notice] = "Column successfully deleted" if @column.destroy
    respond_with(@page)
  end
  
  def move_column_higher
    @column = Column.find(params[:id])
    @page = @column.page
    flash[:notice] = "That column was moved up one space on the page." if @column.move_higher
    redirect_to(@page)
  end
  
  def move_column_lower
    @column = Column.find(params[:id])
    @page = @column.page
    flash[:notice] = "That column was moved down one space on the page." if @column.move_lower
    redirect_to(@page)
  end
end
