class CompitiController < ApplicationController
  before_action :set_compito, only: [:show, :edit, :update, :destroy]

  # GET /compiti
  # GET /compiti.json
  def index
    @compiti = Compito.all
  end

  # GET /compiti/1
  # GET /compiti/1.json
  def show
  end

  # GET /compiti/new
  def new
    @compito = Compito.new
  end

  # GET /compiti/1/edit
  def edit
  end

  # POST /compiti
  # POST /compiti.json
  def create
    @compito = Compito.new(compito_params)

    respond_to do |format|
      if @compito.save
        format.html { redirect_to @compito, notice: 'Compito was successfully created.' }
        format.json { render :show, status: :created, location: @compito }
      else
        format.html { render :new }
        format.json { render json: @compito.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /compiti/1
  # PATCH/PUT /compiti/1.json
  def update
    respond_to do |format|
      if @compito.update(compito_params)
        format.html { redirect_to @compito, notice: 'Compito was successfully updated.' }
        format.json { render :show, status: :ok, location: @compito }
      else
        format.html { render :edit }
        format.json { render json: @compito.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /compiti/1
  # DELETE /compiti/1.json
  def destroy
    @compito.destroy
    respond_to do |format|
      format.html { redirect_to compiti_url, notice: 'Compito was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_compito
      @compito = Compito.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def compito_params
      params.require(:compito).permit(:data, :oggetto)
    end
end
