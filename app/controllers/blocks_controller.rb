class BlocksController < ApplicationController
  respond_to :html, :xml, :json
  before_filter :authenticate_user!, :except => [:show] 
  
  # GET /blocks
  # GET /blocks.xml
  def index
    @blocks = Block.all
    respond_with(@blocks)
  end

  # GET /blocks/1
  # GET /blocks/1.xml
  def show
    @block = Block.find(params[:id])
    respond_with(@block)
  end

  # GET /blocks/new
  # GET /blocks/new.xml
  def new
    @column = Column.find(params[:column_id])
    @block = @column.blocks.new
    @page = @block.column.page
    respond_with(@page)
  end

  # GET /blocks/1/edit
  def edit
    @block = Block.find(params[:id])
  end

  # POST /blocks
  # POST /blocks.xml
  def create
    @column = Column.find(params[:column_id])
    @page = @column.page
    @block = @column.blocks.new(params[:block])
    flash[:notice] = "Block successfully created" if @block.save
    respond_with(@page)
  end

  # PUT /blocks/1
  # PUT /blocks/1.xml
  def update
    @block = Block.find(params[:id])
    @block.update_attributes(params[:block])
    @page = @block.column.page
    respond_with(@page)
  end

  # DELETE /blocks/1
  # DELETE /blocks/1.xml
  def destroy
    @block = Block.find(params[:id])
    @page = @block.column.page 
    @block.destroy
    respond_with(@page)
  end
  
  def move_block_higher
    @block = Block.find(params[:id])
    @page = @block.column.page
    flash[:notice] = "That block was moved up one space in its column" if @block.move_higher
    redirect_to(@page)
  end
  
  def move_block_lower
    @block = Block.find(params[:id])
    @page = @block.column.page
    flash[:notice] = "That block was moved down one space in its column" if @block.move_lower
    redirect_to(@page)
  end

end
