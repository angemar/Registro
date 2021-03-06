class AttivitaextrasController < ApplicationController
  before_action :set_attivitaextra, only: [:show, :edit, :update, :destroy]
  before_filter :is_permitted, only: [:new, :edit, :update, :destroy]
  before_filter :is_owner, only: [:edit, :update, :destroy] 
  before_filter :capt_param, only: [:is_owner]

  def capt_param
    @attivitaextra ||= Attivitaextra.find(params[:id])
  end
  helper_method :capt_param

  def is_owner
    if session[:role] == "docenza" && capt_param.docenza_id != current_user.id
      redirect_to attivitaextras_path, :alert => "Operazione non permessa"
    end
  end

  def is_permitted
    if session[:role] != "docenza"
      redirect_to :back, :alert => "Operazione non permessa"
    end
  end

  # GET /attivitaextras
  # GET /attivitaextras.json
  def index
    if params[:sezione_id]
      @attivitaextras = Attivitaextra.where(sezione_id: params[:sezione_id])
    else
      @attivitaextras = Attivitaextra.all
    end
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
      params.require(:attivitaextra).permit(:descrizione, :datainizio, :datafine, :luogo, :orainizio, :orafine, :docenza_id, :sezione_id)
    end
end
