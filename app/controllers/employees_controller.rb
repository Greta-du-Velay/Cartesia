class EmployeesController < ApplicationController
  before_filter :authenticate_user!, :except => [:report, :get_report_data]

  before_filter do
    cid = session[:guest_report_company]
    if cid.nil?
      @company = @user.companies.find(params[:company_id]) if params[:company_id].present?
    else
      @company = Company.find(cid)
    end

    @employee = @company.employees.find(params[:id]) if params[:id].present?
  end

  # GET /employees
  def index
    @employees = @company.employees.order('name ASC')
    @employee = Employee.new

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /employees/1
  def __show
    @employee = Employee.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /employees/new
  def __new
    @employee = Employee.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /employees/1/edit
  def edit
  end

  # POST /employees
  def create
    @employee = Employee.new(params[:employee])
    @employee.password = @employee.password_confirmation = (0...10).map{ ('a'..'z').to_a[rand(26)] }.join
    @employee.role = 'employee'

    @company.employees << @employee
    
    respond_to do |format|
      if @employee.save and @company.save
        format.html { redirect_to(levels_company_employee_url(@company, @employee), :notice => 'Employee was successfully created.') }
      else
        format.html {
          flash[:error] = 'Failed to create a new employee.'
          redirect_to(company_employees_url(@company)) }
      end
    end
  end

  # PUT /employees/1
  def update
    respond_to do |format|
      if @employee.update_attributes(params[:employee])
        format.html { redirect_to(company_employees_path(@company), :notice => 'Employee was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /employees/1
  def destroy
    @employee.destroy

    respond_to do |format|
      format.html { redirect_to(company_employees_url(@company)) }
    end
  end
  
  
  # levels
  
  def levels

    case request.method
    when 'GET' then
      #@employee.normalize_levels

      respond_to do |format|
        format.html # index.html.erb
      end

    when 'POST' then
      @employee.company.bcns.each do |bcn|
        bcn.learning_indicators.each do |li|
          level = @employee.levels.where(:learning_indicator_id => li.id).first

          initial_level = params[:initial_levels][li.id.to_s].to_i
          target_level = params[:target_levels][li.id.to_s].to_i

          initial_level = [initial_level, target_level].min
          target_level = [initial_level, target_level].max

          initial_level = [initial_level, 1].max
          target_level = [10, target_level].min

          level.initial_level = initial_level
          level.target_level = target_level
          
          level.not_relevant = (params[:not_relevant].nil? || params[:not_relevant][li.id.to_s].nil?) ? false : true
          
          #level.priority_rating = PriorityRating.find(params[:priority_ratings][li.id.to_s])
          
          level.save
        end
      end

      redirect_to company_employees_path(@company), :notice => "Learning indicators for user <em>#{@employee.name}</em> successfully updated.".html_safe
    end
  end


  # update levels
  
  def skills

    case request.method
    when 'GET' then
      #@employee.normalize_levels

      respond_to do |format|
        format.html # index.html.erb
      end

    when 'POST' then
      @employee.company.bcns.each do |bcn|
        bcn.learning_indicators.each do |li|
          level = @employee.levels.where(:learning_indicator_id => li.id).first
          current_level = params[:current_levels][li.id.to_s].to_i
          current_level = [level.initial_level, current_level].max
          current_level = [level.target_level, current_level].min
          level.current_level = current_level
          level.save
        end
      end

      redirect_to company_employees_path(@company), :notice => "Learning indicators for user <em>#{@employee.name}</em> successfully updated.".html_safe
    end
  end

  def get_report_data
    string = ''

    @employee.levels.each do |l|            
      if !l.not_relevant
        liname = l.learning_indicator.label.blank? ? l.learning_indicator.name.ellips : l.learning_indicator.label
        l_comp = l.completion
        if !l_comp.nil?
          string += liname.gsub('|','/') + '|' + (l_comp * 100).to_i.to_s + "\n"
        end
      end
    end

    render :inline => string
  end

  def report
    if params['inline'] == '1'
      render :layout => false
    end    
    #render :layout => false
  end


end
