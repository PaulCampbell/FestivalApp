class FestivalsController < ApplicationController
  before_filter :admin_user,   :only => :index
  
  
  # GET /festivals
  # GET /festivals.xml
  def index
    @festivals = Festival.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @festivals }
    end
  end

  # GET /festivals/1
  # GET /festivals/1.xml
  def show
    @festival = Festival.find(params[:id])
    @title = @festival.name
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @festival }
    end
  end

  # GET /festivals/new
  # GET /festivals/new.xml
  def new
    @festival = Festival.new
    @title = "Add your festival"
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @festival }
    end
  end

  # GET /festivals/1/edit
  def edit
    @festival = Festival.find(params[:id])
  end

  # POST /festivals
  # POST /festivals.xml
  def create
    @festival = Festival.new(params[:festival])
    
    respond_to do |format|
      if @festival.save
        current_user.festivals << @festival

        flash[:success] = "Festival was successfully created."
        format.html { redirect_to(@festival) }
        format.xml  { render :xml => @festival, :status => :created, :location => @festival }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @festival.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /festivals/1
  # PUT /festivals/1.xml
  def update
    @festival = Festival.find(params[:id])

    respond_to do |format|
      if @festival.update_attributes(params[:festival])
          flash[:success] = "Festival was successfully updated."
        format.html { redirect_to(@festival) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @festival.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /festivals/1
  # DELETE /festivals/1.xml
  def destroy
    @festival = Festival.find(params[:id])
    @festival.destroy
    flash[:success] = "Festival was successfully deleted."
    respond_to do |format|
      format.html { redirect_to(festivals_url) }
      format.xml  { head :ok }
    end
  end
end
