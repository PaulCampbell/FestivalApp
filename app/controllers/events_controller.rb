class EventsController < ApplicationController
# GET /Events
  # GET /Events.xml
  def index
    @events = Event.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => events }
    end
  end

  # GET /Events/1
  # GET /Events/1.xml
  def show
    @event= Event.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @event}
    end
  end

  # GET /Events/new
  # GET /Events/new.xml
  def new
    @event= Event.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @event}
    end
  end

  # GET /Events/1/edit
  def edit
    @event= Event.find(params[:id])
  end

  # POST /Events
  # POST /Events.xml
  def create
    @event= Event.new(params[:Event])

    respond_to do |format|
      if @event.save
        format.html { redirect_to(@event, :notice => 'Event was successfully created.') }
        format.xml  { render :xml => @event, :status => :created, :location => @event}
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /Events/1
  # PUT /Events/1.xml
  def update
    @event= Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to(@event, :notice => 'Event was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /Events/1
  # DELETE /Events/1.xml
  def destroy
    @event= Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to(event@eventss_url) }
      format.xml  { head :ok }
    end
  end
end
