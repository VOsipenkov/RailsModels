class EmploymentsController < ApplicationController
  before_action :set_employment, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token, :only => [:api_create, :api_index, :api_show, :api_update, :api_destroy]

  # GET /employments
  # GET /employments.json
  def index
    # @employments = Employment.all
    @employments = Employment.where(employ_id:params[:employ_id])
  end
#id: integer, nameTask: string, status: string, date: string, employ_id: integer,
  # GET /employments/1
  # GET /employments/1.json
  def show
  end

  # GET /employments/new
  def new
    @employment = Employment.new
    @employ = Employ.where(id: params[:employ_id]).first
    @organization = Organization.where(id: params[:organization_id]).first
  end

  # GET /employments/1/edit
  def edit
  end

  # POST /employments
  # POST /employments.json
  def create
    @employment = Employment.new(employment_params)
    puts employment_params
    @employment.employ= Employ.where(id: params[:employ_id]).first

    respond_to do |format|
      if @employment.save
        format.html { redirect_to organization_employ_employments_path, notice: 'Employment was successfully created.' }
        format.json { render :show, status: :created, location: @employment }
      else
        format.html { render :new }
        format.json { render json: @employment.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /employments/1
  # PATCH/PUT /employments/1.json
  def update
    respond_to do |format|
      if @employment.update(employment_params)
        format.html { redirect_to @employment, notice: 'Employment was successfully updated.' }
        format.json { render :show, status: :ok, location: @employment }
      else
        format.html { render :edit }
        format.json { render json: @employment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employments/1
  # DELETE /employments/1.json
  def destroy
    @employment.destroy
    respond_to do |format|
      format.html { redirect_to employments_url, notice: 'Employment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


#===============================API AREA===============================================================

  def api_all_employments
    @employment = Employment.all
    render :json => {:success => true, :employment => @employment}
  end

  def api_create
    @employment = Employment.new(employment_params)
    @employ = Employ.where(:id => params[:employ_id]).first
    @employment.employ = @employ
    if @employment.save
      render :json => {:success => true, :employment=> @employment}
    else
      render :json => {:success => false}
    end
  end

  def api_index
    @employment= Employment.where(:employ_id => params[:employ_id])
    render :json => {:success => true, :employment => @employment}
  end

  def api_show
    @employment = Employment.find_by_id(params[:id])
    render :json => {:success => true, :employment => @employment}
  end

  def api_update
    @employment = Employment.find_by_id(params[:id])

    if @employment.update(employment_params)
      render :json => {:success => true, :employment => @employment}
    else
      render :json => {:success => false}
    end
  end

  def api_destroy
    @employment = Employment.find_by_id(params[:id])
    @employment.destroy
    render :json => {:success => true}
  end


  #======================================================================================================

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employment
      @employment = Employment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employment_params
      params.require(:employment).permit(:nameTask, :status, :date, :employ_id)
    end
end
