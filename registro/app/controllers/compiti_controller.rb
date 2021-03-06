class CompitiController < ApplicationController
  before_action :set_compito, only: [:show, :edit, :update, :destroy]
  before_filter :classe_assegnata, only: [:new]
  before_filter :is_permitted, only: [:new, :edit, :update, :destroy]
  before_filter :is_owner, only: [:edit, :update, :destroy] 
  before_filter :capt_param, only: [:is_owner]

  def capt_param
    @compito ||= Compito.find(params[:id])
  end
  helper_method :capt_param

  def is_owner
    if session[:role] == "docenza" && capt_param.docenza_id != current_user.id
      redirect_to compiti_path, :alert => "Operazione non permessa"
    end
  end

  def is_permitted
    if session[:role] != "docenza"
      redirect_to :back, :alert => "Operazione non permessa"
    end
  end

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

  def classe_assegnata
    if DocenzaSezioneMateria.exists?(docenza_id: current_user.id) == false
      redirect_to menudocenza_url, notice: 'Lei non ha nessuna classe assegnata!' 
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_compito
      @compito = Compito.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def compito_params
      params.require(:compito).permit(:data, :oggetto, :docenza_id, :materia_id, :sezione_id)
    end
end
