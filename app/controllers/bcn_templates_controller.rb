class BcnTemplatesController < ApplicationController
  # GET /bcn_templates
  # GET /bcn_templates.xml
  def index
    @bcn_templates = BcnTemplate.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @bcn_templates }
    end
  end

  # GET /bcn_templates/1
  # GET /bcn_templates/1.xml
  def show
    @bcn_template = BcnTemplate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @bcn_template }
    end
  end

  # GET /bcn_templates/new
  # GET /bcn_templates/new.xml
  def new
    @bcn_template = BcnTemplate.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @bcn_template }
    end
  end

  # GET /bcn_templates/1/edit
  def edit
    @bcn_template = BcnTemplate.find(params[:id])
  end

  # POST /bcn_templates
  # POST /bcn_templates.xml
  def create
    @bcn_template = BcnTemplate.new(params[:bcn_template])

    respond_to do |format|
      if @bcn_template.save
        format.html { redirect_to(@bcn_template, :notice => 'Bcn template was successfully created.') }
        format.xml  { render :xml => @bcn_template, :status => :created, :location => @bcn_template }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @bcn_template.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /bcn_templates/1
  # PUT /bcn_templates/1.xml
  def update
    @bcn_template = BcnTemplate.find(params[:id])

    respond_to do |format|
      if @bcn_template.update_attributes(params[:bcn_template])
        format.html { redirect_to(@bcn_template, :notice => 'Bcn template was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @bcn_template.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /bcn_templates/1
  # DELETE /bcn_templates/1.xml
  def destroy
    @bcn_template = BcnTemplate.find(params[:id])
    @bcn_template.destroy

    respond_to do |format|
      format.html { redirect_to(bcn_templates_url) }
      format.xml  { head :ok }
    end
  end
end
