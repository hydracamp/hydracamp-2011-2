class UndeadController < ApplicationController
  before_filter :require_fedora
  before_filter :require_solr
  
  def show
    @undead = Undead.find(params[:id])
    
    respond_to do |format|
      format.html 
      format.xml { render :xml => @undead.to_xml }
      # format.json { render :json => @undead.to_json }
    end
  end
  
  def edit
    @undead = Undead.find(params[:id])
    
    respond_to do |format|
      format.html 
      format.xml { render :xml => @undead.to_xml }
      # format.json { render :json => @undead.to_json }
    end
  end
  
  def new
    @undead = Undead.new
  end
  
  def create
    @undead = Undead.new(params[:undead])
    if @undead.save
      flash[:notice] = "Created #{@undead.first_name}"
    else
      flash[:error] = "Failed to create your undead!"
    end
    redirect_to edit_undead_path(@undead)
  end
  
  def update
    @undead = Undead.find(params[:id])
    @undead.update_attributes(params[:undead])
    if @undead.save
      flash[:notice] = "Saved changes to #{@undead.first_name}"
    else
      flash[:error] = "Failed to save your changes!"
    end
    redirect_to edit_undead_path(@undead)
  end
  
  
  
end