class LearningIndicatorsController < ApplicationController

  before_filter do
    @company = @user.companies.find(params[:company_id]) if params[:company_id].present?
    @bcn = @company.bcns.find(params[:bcn_id]) if params[:bcn_id].present?
    @learning_indicator = @bcn.learning_indicators.find(params[:id]) if params[:id].present?
  end

  # GET /learning_indicators
  def index
    @learning_indicators = @bcn.learning_indicators
    @learning_indicator = LearningIndicator.new

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /learning_indicators/1
  # GET /learning_indicators/1.xml
  def __show
    @learning_indicator = LearningIndicator.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @learning_indicator }
    end
  end

  # GET /learning_indicators/new
  # GET /learning_indicators/new.xml
  def __new
    @learning_indicator = @bcn.learning_indicators.build

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /learning_indicators/1/edit
  def edit
  end

  # POST /learning_indicators
  def create
    @learning_indicator = @bcn.learning_indicators.build(params[:learning_indicator])

    respond_to do |format|
      if @learning_indicator.save
        format.html { redirect_to(company_bcn_learning_indicators_path(@company, @bcn), :notice => 'Learning indicator was successfully created.') }
      else
        format.html {
          flash[:error] = 'This learning indicator already exists.'
          redirect_to :action => "index"
        }
      end
    end
  end

  # PUT /learning_indicators/1
  def update
    respond_to do |format|
      if @learning_indicator.update_attributes(params[:learning_indicator])
        format.html { redirect_to(company_bcn_learning_indicators_path(@company, @bcn), :notice => 'Learning indicator was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /learning_indicators/1
  def destroy
    @learning_indicator.destroy

    respond_to do |format|
      format.html { redirect_to(company_bcn_learning_indicators_url(@company, @bcn)) }
    end
  end
end
