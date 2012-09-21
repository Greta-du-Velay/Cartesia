class PriorityRatingsController < ApplicationController
  # GET /priority_ratings
  # GET /priority_ratings.xml
  def index
    @priority_ratings = PriorityRating.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @priority_ratings }
    end
  end

  # GET /priority_ratings/1
  # GET /priority_ratings/1.xml
  def show
    @priority_rating = PriorityRating.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @priority_rating }
    end
  end

  # GET /priority_ratings/new
  # GET /priority_ratings/new.xml
  def new
    @priority_rating = PriorityRating.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @priority_rating }
    end
  end

  # GET /priority_ratings/1/edit
  def edit
    @priority_rating = PriorityRating.find(params[:id])
  end

  # POST /priority_ratings
  # POST /priority_ratings.xml
  def create
    @priority_rating = PriorityRating.new(params[:priority_rating])

    respond_to do |format|
      if @priority_rating.save
        format.html { redirect_to(@priority_rating, :notice => 'Priority rating was successfully created.') }
        format.xml  { render :xml => @priority_rating, :status => :created, :location => @priority_rating }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @priority_rating.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /priority_ratings/1
  # PUT /priority_ratings/1.xml
  def update
    @priority_rating = PriorityRating.find(params[:id])

    respond_to do |format|
      if @priority_rating.update_attributes(params[:priority_rating])
        format.html { redirect_to(@priority_rating, :notice => 'Priority rating was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @priority_rating.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /priority_ratings/1
  # DELETE /priority_ratings/1.xml
  def destroy
    @priority_rating = PriorityRating.find(params[:id])
    @priority_rating.destroy

    respond_to do |format|
      format.html { redirect_to(priority_ratings_url) }
      format.xml  { head :ok }
    end
  end
end
