class CompaniesController < ApplicationController
  before_filter :authenticate_user!, :except => [:report, :get_report_data, :fullreport]

  before_filter do
    cid = session[:guest_report_company]
    if cid.nil?
      @company = @user.companies.find(params[:id]) if params[:id].present?
    else
      @company = Company.find(cid)
    end
  end

  # GET /companies
  def __index
    @companies = @user.companies

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /companies/1
  def show
    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # employee select menu on company page
  def update_levels
    redirect_to skills_company_employee_url(params[:id], params[:employee_id])
  end


  # GET /companies/new
  def new
    @company = Company.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /companies/1/edit
  def edit
  end

  # POST /companies
  def create
    @company = Company.new(params[:company])
    @user.companies << @company

    respond_to do |format|
      if @company.save and @user.save
        format.html { redirect_to(company_path(@company), :notice => 'Company was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /companies/1
  def update    
    respond_to do |format|
      if @company.update_attributes(params[:company])
        format.html { redirect_to(company_path(@company), :notice => 'Company was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /companies/1
  def destroy
  end


  def create_random

    c = @user.companies.create(:fake => true, :name => Faker::Company.name, :manager => Faker::Name.name, :description => "This is fake company, for testing purpose only ----- " + Faker::Lorem.paragraph, :workers_count => 5+rand(50))
    
    (2 + rand(3)).times.each do
      c.employees.create(:name => Faker::Name.name, :email => Faker::Internet.email, :password => 'azerty345345', :password_confirmation => 'azerty345345')
    end

    nb_bcn = 3 + rand(4)
    nb_bcn.times.each do
      c.bcns.create(:name => '[bcn] ' + Faker::Lorem.sentence, :description => Faker::Lorem.paragraphs(1+rand(2)).join)
    end

    c.bcns.each do |bcn|
      (3+rand(3)).times do 
        bcn.learning_indicators.create(:name => '[li] ' + Faker::Lorem.sentence)
      end
    end

    Level.find_each do |li|
      ill = rand(10)+1
      tl = rand(10)+1
      il = [ill, tl].min
      tl = [ill, tl].max
      cl = il+rand(tl-il+1)
      li.update_attributes(:initial_level => il, :current_level => cl, :target_level => tl, :priority_rating_id => 1)
    end

    flash[:notice] = "Your fake company has been created..."
    redirect_to company_url(c)
  end


  def reset_permalink
    @company.set_permalink
    @company.save
    flash[:notice] = t(:permalink_changed)
    redirect_to report_company_url(@company)   
  end


  def get_report_data
    string = ''

    @company.bcns.each do |b|
      bcnname = b.label.blank? ? b.name.ellips : b.label           
      b_comp = b.completion
      if !b_comp.nil?
        string += bcnname.gsub('|','/') + '|' + b.learning_indicators.count.to_s + '|' + (b_comp * 100).to_i.to_s + "\n"
      end
    end

    render :inline => string
  end

  def report
    
=begin
    @company.employees.each do |e|            
      e.normalize_levels
      logger.debug "Employee #{e.id} completion ->" + e.completion.to_s
      @company.bcns.each do |bcn|
        logger.debug "Employee #{e.id} bcn #{bcn.id} completion ->" + e.bcn_completion(bcn.id).to_s
      end
    end

    @company.bcns.each do |b|            
      logger.debug "BCN #{b.name} completion ->" + b.completion.to_s
    end
=end

  end

  def fullreport
  end

    
end
