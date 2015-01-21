class EmploysController < ApplicationController
  before_action :set_employ, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token, :only => [:api_create, :api_index, :api_show, :api_update, :api_destroy]
  # GET /employs
  # GET /employs.json
  def index

    @employs = Employ.where(organization_id: params[:organization_id])
    @organization = Organization.where(id: params[:organization_id]).first
  end


  #id: integer, name: string, position: string, phone: string,<====================================
  # organization_id: integer, created_at: datetime, updated_at: datetime)

  # GET /employs/1
  # GET /employs/1.json
  def show
  end

  # GET /employs/new
  def new
    @employ = Employ.new
    @organization = Organization.where(id: params[:organization_id]).first
  end

  # GET /employs/1/edit
  def edit
    @employs = Employ.find_by_organization_id(params[:id])
    @organization = Organization.where(id: params[:organization_id]).first
  end

  # POST /employs
  # POST /employs.json
  def create
    @employ = Employ.new(employ_params)
    puts employ_params
    @employ.organization = Organization.where(id: params[:organization_id]).first

    respond_to do |format|
      if @employ.save
        format.html { redirect_to organization_employs_path, notice: 'Employ was successfully created.' }
        format.json { render :show, status: :created, location: @employ }
      else
        format.html { render :new }
        format.json { render json: @employ.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employs/1
  # PATCH/PUT /employs/1.json
  def update
    respond_to do |format|
      if @employ.update(employ_params)
        format.html { redirect_to  organization_employ_path, notice: 'Employ was successfully updated.' }
        format.json { render :show, status: :ok, location: @employ }
      else
        format.html { render :edit }
        format.json { render json: @employ.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employs/1
  # DELETE /employs/1.json
  def destroy
    @organization = @employ.organization
    @employ.destroy
    puts 'first'
    respond_to do |format|
      format.html { redirect_to @organization, notice: 'Employ was successfully destroyed.' }
      format.json { head :no_content }
    end


  end


  #=============================API AREA=================================================

  def api_all_employs
    @employ = Employ.all
    render :json => {:success => true, :employ => @employ}
  end

  def api_create
    @employ = Employ.new(employ_params)
    @organization = Organization.where(:id => params[:organization_id]).first
    @employ.organization = @organization
    if @employ.save
      render :json => {:success => true, :employ => @employ}
    else
      render :json => {:success => false}
    end
  end

  def api_index
    @employ = Employ.where(:organization_id => params[:organization_id])
    render :json => {:success => true, :employ => @employ}
  end

  def api_show
    @employ = Employ.find_by_id(params[:id])
    render :json => {:success => true, :employ => @employ}
  end

  def api_update
    @employ = Employ.find_by_id(params[:id])

    if @employ.update(employ_params)
      render :json => {:success => true, :employ => @employ}
    else
      render :json => {:success => false}
    end
  end

  def api_destroy
    @employ = Employ.find_by_id(params[:id])
    @employ.destroy
    render :json => {:success => true}
  end

  #======================================================================================

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employ
      @employ = Employ.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employ_params
      params.require(:employ).permit(:name, :position, :phone)
    end
end
