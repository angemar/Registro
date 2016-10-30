class AttivitaextrasController < ApplicationController
  before_action :set_attivitaextra, only: [:show, :edit, :update, :destroy]

  # GET /attivitaextras
  # GET /attivitaextras.json
  def index
    @attivitaextras = Attivitaextra.all
  end

  # GET /attivitaextras/1
  # GET /attivitaextras/1.json
  def show
  end

  # GET /attivitaextras/new
  def new
    @attivitaextra = Attivitaextra.new
  end

  # GET /attivitaextras/1/edit
  def edit
  end

  # POST /attivitaextras
  # POST /attivitaextras.json
  def create
    @attivitaextra = Attivitaextra.new(attivitaextra_params)

    respond_to do |format|
      if @attivitaextra.save
        format.html { redirect_to @attivitaextra, notice: 'Attivitaextra was successfully created.' }
        format.json { render :show, status: :created, location: @attivitaextra }
      else
        format.html { render :new }
        format.json { render json: @attivitaextra.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attivitaextras/1
  # PATCH/PUT /attivitaextras/1.json
  def update
    respond_to do |format|
      if @attivitaextra.update(attivitaextra_params)
        format.html { redirect_to @attivitaextra, notice: 'Attivitaextra was successfully updated.' }
        format.json { render :show, status: :ok, location: @attivitaextra }
      else
        format.html { render :edit }
        format.json { render json: @attivitaextra.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attivitaextras/1
  # DELETE /attivitaextras/1.json
  def destroy
    @attivitaextra.destroy
    respond_to do |format|
      format.html { redirect_to attivitaextras_url, notice: 'Attivitaextra was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attivitaextra
      @attivitaextra = Attivitaextra.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attivitaextra_params
      params.require(:attivitaextra).permit(:descrizione, :datainizio, :datafine, :luogo, :orainizio, :orafine, :docenza_id)
    end
end
