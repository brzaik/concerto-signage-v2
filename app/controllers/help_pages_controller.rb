class HelpPagesController < ApplicationController
	before_filter :authenticate_user!, :except => [:index, :show, :search]
	protect_from_forgery :only => [:new, :edit, :create, :update, :destroy]
	
	def send_email
		HelpFeedback::deliver_contact_email(params[:email])
		redirect_to :controller => 'help_pages'
	end
	
  # GET /help_pages
  # GET /help_pages.json
  def index
    @categories = Category.help_page_categories
    
    @title = 'Help Center'
        
    respond_to do |format|
      format.html { render :layout => "help_page" } # index.html.erb
      format.json { render :json => @categories }
    end
  end

  # GET /help_pages/1
  # GET /help_pages/1.json
  def show
    @help_page = HelpPage.find(params[:id])
    @new_contact = Contact.new
    @category = @help_page.category
    @otherpages = @category.help_pages

    respond_to do |format|
      format.html { render :layout => "help_page" }# show.html.erb
      format.json { render :json => @help_page }
    end
  end

  # GET /help_pages/new
  # GET /help_pages/new.json
  def new
    @help_page = HelpPage.new
	  @title = 'Create New Help Page'
		
    respond_to do |format|
      format.html {  } # new.html.erb
      format.json { render :json => @help_page }
    end
  end

  # GET /help_pages/1/edit
  def edit
    @help_page = HelpPage.find(params[:id])
    @title = 'Edit Existing Help Page: <em>' + @help_page.name + '</em>'
    respond_to do |format|
      format.html {  } # new.html.erb
      format.xml  { render :xml => @help_page }
    end
  end

  # POST /help_pages
  # POST /help_pages.json
  def create
    @help_page = HelpPage.new(params[:help_page])

    respond_to do |format|
      if @help_page.save
        flash[:notice] = 'Help page was successfully created'
        format.html { redirect_to(@help_page) }
        format.xml  { render :xml => @help_page, :status => :created, :location => @help_page }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @help_page.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /help_pages/1
  # PUT /help_pages/1.json
  def update
    @help_page = HelpPage.find(params[:id])

    respond_to do |format|
      if @help_page.update_attributes(params[:help_page])
        flash[:notice] = 'Help page was successfully updated'
        format.html { redirect_to @help_page, :notice => 'Help page was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @help_page.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /help_pages/1
  # DELETE /help_pages/1.json
  def destroy
    @help_page = HelpPage.find(params[:id])
    flash[:notice] = 'Help page was successfully deleted' if @help_page.destroy

    respond_to do |format|
      format.html { redirect_to help_pages_path }
      format.json { head :ok }
    end
  end

  def search
    @help_page_results = HelpPage.search_tank(params[:query], :snippets => [:content], :paginate => false)
    
    respond_to do |format|
      format.html
    end
  end

end
