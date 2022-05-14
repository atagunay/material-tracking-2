class MaterialsController < ApplicationController
  before_action :set_material, only: %i[ show edit update destroy ]
  before_action :correct_user, only: [ :edit, :update, :destroy ]

  # GET /materials or /materials.json
  def index
    @materials = Material.all
    respond_to do |format|
      format.html
      format.csv {send_data @materials.to_csv}
      format.pdf do
        render pdf: "file_name", template: "materials/pdfView", formats: [:html]
      end
    end

  end

  # GET /materials/1 or /materials/1.json
  def show
  end

  # GET /materials/new
  def new
    #@material = Material.new
    @material = current_user.material.build
  end

  # GET /materials/1/edit
  def edit
  end

  #???????????????????????????
  def correct_user
    @material = current_user.material.find_by(id: params[:id])
    redirect_to materials_path, notice: "Not Authorized For This Operation" if @material.nil?
  end

  # POST /materials or /materials.json
  def create
    #@material = Material.new(material_params)
    @material = current_user.material.build(material_params)

    respond_to do |format|
      if @material.save
        format.html { redirect_to material_url(@material), notice: "Material was successfully created." }
        format.json { render :show, status: :created, location: @material }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @material.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /materials/1 or /materials/1.json
  def update

    

    respond_to do |format|
      if @material.update(material_params)
        format.html { redirect_to material_url(@material), notice: "Material was successfully updated." }
        format.json { render :show, status: :ok, location: @material }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @material.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /materials/1 or /materials/1.json
  def destroy
    @material.destroy

    respond_to do |format|
      format.html { redirect_to materials_url, notice: "Material was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_material
      @material = Material.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    # params.require(:material).permit! => allow all parameters
    def material_params
      params.require(:material).permit(:name, :explanation, :quantity, :reorder_quantity, :user_id, :location, :status_id)
    end
end
