class VotiController < ApplicationController
  before_action :set_voto, only: [:show, :edit, :update, :destroy]
  before_filter :classe_assegnata, only: [:new]
  before_filter :is_permitted, only: [:new, :edit, :update, :destroy]
  before_filter :is_owner, only: [:edit, :update, :destroy] 
  before_filter :capt_param, only: [:is_owner]

  def capt_param
    @voto ||= Voto.find(params[:id])
  end
  helper_method :capt_param

  def is_owner
    if session[:role] == "docenza" && capt_param.docenza_id != current_user.id
      redirect_to compiti_path, :alert => "Operazione non permessa"
    end
  end  

  def is_permitted
    if session[:role] == "alunno"
      redirect_to :back, :alert => "Operazione non permessa"
    end
  end

  # GET /voti
  # GET /voti.json
  def index
    if params[:alunno_id]
      @voti = Voto.where(alunno_id: params[:alunno_id])
    else
      @voti = Voto.all
    end
  end

  # GET /voti/1
  # GET /voti/1.json
  def show
  end

  # GET /voti/new
  def new
    @voto = Voto.new
  end

  # GET /voti/1/edit
  def edit
  end

  # POST /voti
  # POST /voti.json
  def create
    @voto = Voto.new(voto_params)

    respond_to do |format|
      if @voto.save
        format.html { redirect_to @voto, notice: 'Voto was successfully created.' }
        format.json { render :show, status: :created, location: @voto }
      else
        format.html { render :new }
        format.json { render json: @voto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /voti/1
  # PATCH/PUT /voti/1.json
  def update
    respond_to do |format|
      if @voto.update(voto_params)
        format.html { redirect_to @voto, notice: 'Voto was successfully updated.' }
        format.json { render :show, status: :ok, location: @voto }
      else
        format.html { render :edit }
        format.json { render json: @voto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /voti/1
  # DELETE /voti/1.json
  def destroy
    @voto.destroy
    respond_to do |format|
      format.html { redirect_to voti_url, notice: 'Voto was successfully destroyed.' }
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
    def set_voto
      @voto = Voto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def voto_params
      params.require(:voto).permit(:data, :valore, :materia_id, :docenza_id, :alunno_id)
    end
end
