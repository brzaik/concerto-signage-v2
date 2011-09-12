class HelpPagesController < ApplicationController
	layout "page", :except => [:auto_complete_for_search_query]
	before_filter :require_login, :only => [:new, :edit, :create, :update, :destroy]
	protect_from_forgery :only => [:new, :edit, :create, :update, :destroy]
	
	def send_email
		HelpFeedback::deliver_contact_email(params[:email])
		redirect_to :controller => 'help_pages'
	end
	
  def auto_complete_for_search_query
    @help_pages = HelpPage.find_with_ferret(params["search"]["query"]+"*", {:limit => 5})
    render :partial => "search_results"
  end
  
  def search_results_inpage
  	@help_pages = HelpPage.find_with_ferret(params[:id] + "*")
  	@title = 'Search Concerto Help'
  	render :layout => 'application'
  end
  
  # GET /help_pages
  # GET /help_pages.json
  def index
    @categories = Category.find(:all)
    
    @title = 'Help Center'
    
    @meta_description = "This is the index page for Help and Support for the Concerto Digital Signage software package.  " + @meta_description
    @meta_keywords += " help, support, index, help center, help links, tutorial, how-to"
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @categories }
    end
  end

  # GET /help_pages/1
  # GET /help_pages/1.json
  def show
    @help_page = HelpPage.find(params[:id])

    @category = @help_page.category
    @otherpages = @category.help_pages
    @cat_icon = @category.picture

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @help_page }
    end
  end

  # GET /help_pages/new
  # GET /help_pages/new.json
  def new
    @help_page = HelpPage.new
	@title = 'Create New Help Page'
		
    respond_to do |format|
      format.html { render :layout => 'admin' } # new.html.erb
      format.json { render json: @help_page }
    end
  end

  # GET /help_pages/1/edit
  def edit
    @help_page = HelpPage.find(params[:id])
    @title = 'Edit Existing Help Page: <em>' + @help_page.name + '</em>'
    respond_to do |format|
      format.html { render :layout => 'admin' } # new.html.erb
      format.xml  { render :xml => @help_page }
    end
  end

  # POST /help_pages
  # POST /help_pages.json
  def create
    @help_page = HelpPage.new(params[:help_page])

    respond_to do |format|
      if @help_page.save
        flash[:notice] = 'HelpPage was successfully created.'
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
        format.html { redirect_to @help_page, notice: 'Help page was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @help_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /help_pages/1
  # DELETE /help_pages/1.json
  def destroy
    @help_page = HelpPage.find(params[:id])
    @help_page.destroy

    respond_to do |format|
      format.html { redirect_to help_pages_url }
      format.json { head :ok }
    end
  end
end
