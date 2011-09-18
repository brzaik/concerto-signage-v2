class ContactsController < ApplicationController
  respond_to :html, :xml, :json
  before_filter :require_admin, :only => [:index, :destroy]   
  	
  # GET /contacts
  # GET /contacts.xml
  def index
    @contacts = Contact.all
    respond_with(@contacts)
  end

  # POST /contacts
  # POST /contacts.xml
  def create
    @contact = Contact.new(params[:contact])
    @contact.controller_name = params[:controller_name]
    @contact.page_slug = params[:page_slug]
    flash[:notice] = "Contact successfully created" if @contact.save
    ContactMailer.contact_confirmation(@contact).deliver
    redirect_to :back
    #respond_with(@contact)
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.xml
  def destroy
    @contact = Contact.find(params[:id])
    flash[:notice] = "Contact successfully deleted" if @contact.destroy
    respond_with(@contact)
  end
end
