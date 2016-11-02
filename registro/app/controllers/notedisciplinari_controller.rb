class NotedisciplinariController < ApplicationController
  before_action :set_notadisciplinare, only: [:show, :edit, :update, :destroy]
  before_filter :is_permitted, only: [:new, :edit, :update, :destroy]
  before_filter :is_owner, only: [:edit, :update, :destroy] 
  before_filter :capt_param, only: [:is_owner]

  def capt_param
    @notadisciplinare ||= Notadisciplinare.find(params[:id])
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

  # GET /notedisciplinari
  # GET /notedisciplinari.json
  def index
    if params[:alunno_id]
      @notedisciplinari = Notadisciplinare.where(alunno_id: params[:alunno_id])
    else
      @notedisciplinari = Notadisciplinare.all
    end
  end

  # GET /notedisciplinari/1
  # GET /notedisciplinari/1.json
  def show
  end

  # GET /notedisciplinari/new
  def new
    @notadisciplinare = Notadisciplinare.new
  end

  # GET /notedisciplinari/1/edit
  def edit
  end

  # POST /notedisciplinari
  # POST /notedisciplinari.json
  def create
    @notadisciplinare = Notadisciplinare.new(notadisciplinare_params)

    respond_to do |format|
      if @notadisciplinare.save
        format.html { redirect_to @notadisciplinare, notice: 'Notadisciplinare was successfully created.' }
        format.json { render :show, status: :created, location: @notadisciplinare }
      else
        format.html { render :new }
        format.json { render json: @notadisciplinare.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notedisciplinari/1
  # PATCH/PUT /notedisciplinari/1.json
  def update
    respond_to do |format|
      if @notadisciplinare.update(notadisciplinare_params)
        format.html { redirect_to @notadisciplinare, notice: 'Notadisciplinare was successfully updated.' }
        format.json { render :show, status: :ok, location: @notadisciplinare }
      else
        format.html { render :edit }
        format.json { render json: @notadisciplinare.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notedisciplinari/1
  # DELETE /notedisciplinari/1.json
  def destroy
    @notadisciplinare.destroy
    respond_to do |format|
      format.html { redirect_to notedisciplinari_url, notice: 'Notadisciplinare was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notadisciplinare
      @notadisciplinare = Notadisciplinare.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def notadisciplinare_params
      params.require(:notadisciplinare).permit(:data, :oggetto, :sezione_id, :alunno_id)
    end
end
