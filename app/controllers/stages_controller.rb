class StagesController < ApplicationController
  # GET /stages
  # GET /stages.xml
  def index
	@festival = Festival.find(params[:festival_id])
    @stages = Stage.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @stages }
    end
  end

  # GET /stages/1
  # GET /stages/1.xml
  def show
    @stage = Stage.find(params[:id] , :include => :events)

    @title = @stage.festival.name + " | " + @stage.name

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @stage }
    end
  end

  # GET /stages/new
  # GET /stages/new.xml
  def new
	  @festival = Festival.find(params[:festival_id])
    @stage = @festival.stages.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @stage }
    end
  end

  # GET /stages/1/edit
  def edit
  
	@festival = Festival.find(params[:festival_id])
    @stage = Stage.find(params[:id])
  end

  # POST festivals/1/stages
  # POST festivals/1/stages.xml
  def create
    @festival = Festival.find(params[:festival_id])
    @stage = @festival.stages.build(params[:stage])

    respond_to do |format|
      if @stage.save
        format.html { redirect_to(@festival, :notice => 'Stage was successfully created.') }
        format.xml  { render :xml => @stage, :status => :created, :location => @stage }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @stage.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /stages/1
  # PUT /stages/1.xml
  def update
	@festival = Festival.find(params[:festival_id])
    @stage = Stage.find(params[:id])

    respond_to do |format|
      if @stage.update_attributes(params[:stage])
        format.html { redirect_to(festival_stage_path(@festival, @stage), :notice => 'Stage was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @stage.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /stages/1
  # DELETE /stages/1.xml
  def destroy
    @stage = Stage.find(params[:id])
    @stage.destroy

    respond_to do |format|
      format.html { redirect_to(stages_url) }
      format.xml  { head :ok }
    end
  end
end
