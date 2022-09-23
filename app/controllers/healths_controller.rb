class HealthsController < ApplicationController
  before_action :set_health, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /healths or /healths.json
  def index
    @healths = Health.all
    @q = Health.ransack(params[:q])
    @healths = @q.result.includes(:contractor)
  end

  # GET /healths/1 or /healths/1.json
  def show
  end

  # GET /healths/new
  def new
    @health = Health.new
  end

  # GET /healths/1/edit
  def edit
  end

  # POST /healths or /healths.json
  def create
    @health = Health.new(health_params)

    respond_to do |format|
      if @health.save
        format.html { redirect_to health_url(@health), notice: "Health was successfully created." }
        format.json { render :show, status: :created, location: @health }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @health.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /healths/1 or /healths/1.json
  def update
    respond_to do |format|
      if @health.update(health_params)
        format.html { redirect_to health_url(@health), notice: "Health was successfully updated." }
        format.json { render :show, status: :ok, location: @health }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @health.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /healths/1 or /healths/1.json
  def destroy
    @health.destroy

    respond_to do |format|
      format.html { redirect_to healths_url, notice: "Health was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_health
      @health = Health.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def health_params
      params.require(:health).permit(:codigo_nit_eps, :nombre_eps, :telefono_eps, :ciudad_eps, :correo_eps, :cedula_contratista, :contractor_id)
    end
end
