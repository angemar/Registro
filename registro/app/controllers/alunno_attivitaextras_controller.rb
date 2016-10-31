class AlunnoAttivitaextrasController < ApplicationController
  before_action :set_alunno_attivitaextra, only: [:show, :edit, :update, :destroy]

  # GET /alunno_attivitaextras
  # GET /alunno_attivitaextras.json
  def index
    @alunno_attivitaextras = AlunnoAttivitaextra.all
  end

  # GET /alunno_attivitaextras/1
  # GET /alunno_attivitaextras/1.json
  def show
  end

  # GET /alunno_attivitaextras/new
  def new
    @alunno_attivitaextra = AlunnoAttivitaextra.new
  end

  # GET /alunno_attivitaextras/1/edit
  def edit
  end

  # POST /alunno_attivitaextras
  # POST /alunno_attivitaextras.json
  def create
    @alunno_attivitaextra = AlunnoAttivitaextra.new(alunno_attivitaextra_params)

    respond_to do |format|
      if @alunno_attivitaextra.save
        format.html { redirect_to attivitaextras_path(sezione_id: Alunno.find(current_user.id).sezione_id), notice: 'Partecipazione registrata!' }
        format.json { render :show, status: :created, location: @alunno_attivitaextra }
      else
        format.html { render :new }
        format.json { render json: @alunno_attivitaextra.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /alunno_attivitaextras/1
  # PATCH/PUT /alunno_attivitaextras/1.json
  def update
    respond_to do |format|
      if @alunno_attivitaextra.update(alunno_attivitaextra_params)
        format.html { redirect_to attivitaextras_path(sezione_id: Alunno.find(current_user.id).sezione_id), notice: 'Alunno attivitaextra was successfully updated.' }
        format.json { render :show, status: :ok, location: @alunno_attivitaextra }
      else
        format.html { render :edit }
        format.json { render json: @alunno_attivitaextra.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /alunno_attivitaextras/1
  # DELETE /alunno_attivitaextras/1.json
  def destroy
    @alunno_attivitaextra.destroy
    respond_to do |format|
      format.html { redirect_to attivitaextras_path(sezione_id: Alunno.find(current_user.id).sezione_id), notice: 'Partecipazione annullata' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_alunno_attivitaextra
      @alunno_attivitaextra = AlunnoAttivitaextra.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def alunno_attivitaextra_params
      params.require(:alunno_attivitaextra).permit(:alunno_id, :attivitaextra_id)
    end
end
