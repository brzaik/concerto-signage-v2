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
    @contact.user_ip = request.env['REMOTE_ADDR']
    @contact.user_agent = request.env['HTTP_USER_AGENT'] 
    @contact.referrer = request.env['HTTP_REFERER']
    if verify_recaptcha(:model => @contact, :message => "CAPTCHA Error") && @contact.spam? == false
      if @contact.save
        flash[:notice] = "Contact successfully created"
        ContactMailer.contact_confirmation(@contact).deliver
      else
        flash[:notice] = "Contact failed to create"
      end
    else
      flash[:notice] = "Failed recaptcha.  Try again"
    end
    redirect_to :back #, :locals => {:contacts => @contact}
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.xml
  def destroy
    @contact = Contact.find(params[:id])
    flash[:notice] = "Contact successfully deleted" if @contact.destroy
    respond_with(@contact)
  end
end
