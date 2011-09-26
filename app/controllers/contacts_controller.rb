class ContactsController < ApplicationController
  respond_to :html, :xml, :json
  before_filter :authenticate_user!, :only => [:index, :destroy]   
  	
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
    if verify_recaptcha(:model => @contact, :message => "CAPTCHA Error") && @contact.save
      flash[:notice] = "Contact successfully created"
      ContactMailer.contact_confirmation(@contact).deliver
      redirect_to :back
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.xml
  def destroy
    @contact = Contact.find(params[:id])
    flash[:notice] = "Contact successfully deleted" if @contact.destroy
    respond_with(@contact)
  end
end
