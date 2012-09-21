class BcnsController < ApplicationController
  before_filter :authenticate_user!, :except => [:report, :get_report_data]

  before_filter do
    cid = session[:guest_report_company]
    if cid.nil?
      @company = @user.companies.find(params[:company_id]) if params[:company_id].present?
    else
      @company = Company.find(cid)
    end

    @bcn = @company.bcns.find(params[:id]) if params[:id].present?
  end

  # GET /bcns
  def index
    @bcns = @company.bcns
    @bcn = Bcn.new

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /bcns/1
  # GET /bcns/1.xml
  def show
    @bcn = Bcn.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /bcns/new
  def new
    @bcn = Bcn.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /bcns/1/edit
  def edit
    @bcn = @company.bcns.find(params[:id])
  end

  # POST /bcns
  def create
    @bcn = Bcn.new(params[:bcn])
    @bcn.company = @company

    respond_to do |format|
      if @bcn.save
        format.html { redirect_to(company_bcns_path(@company), :notice => 'Bcn was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /bcns/1
  def update
    respond_to do |format|
      if @bcn.update_attributes(params[:bcn])
        format.html { redirect_to(company_bcns_url(@company), :notice => 'Bcn was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /bcns/1
  def destroy
    @bcn.destroy

    respond_to do |format|
      format.html { redirect_to(company_bcns_url(@company)) }
    end
  end

# For each BCN, a graph showing the progress of each relevant employee
# towards achieving their target levels    
  def get_report_data
    string = ''

    @company.employees.each do |e|
      e_comp = e.bcn_completion(@bcn.id)
      if !e_comp.nil?
        string += e.name.ellips.gsub('|','/') + '|' + (e_comp * 100).to_i.to_s + "\n"
      end
    end

    render :inline => string
  end

  def report
    if params['inline'] == '1'
      render :layout => false
    end
  end

end
