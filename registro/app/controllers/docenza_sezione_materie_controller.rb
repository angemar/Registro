class DocenzaSezioneMaterieController < ApplicationController
  before_action :set_docenza_sezione_materia, only: [:show, :edit, :update, :destroy]

  def nuovoinsegnamento
    @docenza_sezione_materia = DocenzaSezioneMateria.new
    id_sez=params[:sezione_id]
    if id_sez != nil
      @sezione = Sezione.find(id_sez)
    end
  end

  # GET /docenza_sezione_materie
  # GET /docenza_sezione_materie.json
  def index
    @id_sez=params[:sezione_id]
    @docenza_sezione_materie = DocenzaSezioneMateria.where(sezione_id: params[:sezione_id])

  end

  # GET /docenza_sezione_materie/1
  # GET /docenza_sezione_materie/1.json
  def show
  end

  # GET /docenza_sezione_materie/new
  def new
    @docenza_sezione_materia = DocenzaSezioneMateria.new
  end

  # GET /docenza_sezione_materie/1/edit
  def edit
  end

  # POST /docenza_sezione_materie
  # POST /docenza_sezione_materie.json
  def create
    @docenza_sezione_materia = DocenzaSezioneMateria.new(docenza_sezione_materia_params)
    
    respond_to do |format|
      if @docenza_sezione_materia.save
        format.html { redirect_to sezioni_url, notice: 'Docenza sezione materia was successfully created.' }
        format.json { render :show, status: :created, location: @docenza_sezione_materia }
      else
        format.html { render :new }
        format.json { render json: @docenza_sezione_materia.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /docenza_sezione_materie/1
  # PATCH/PUT /docenza_sezione_materie/1.json
  def update
    respond_to do |format|
      if @docenza_sezione_materia.update(docenza_sezione_materia_params)
        format.html { redirect_to sezioni_url, notice: 'Docenza sezione materia was successfully updated.' }
        format.json { render :show, status: :ok, location: @docenza_sezione_materia }
      else
        format.html { render :edit }
        format.json { render json: @docenza_sezione_materia.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /docenza_sezione_materie/1
  # DELETE /docenza_sezione_materie/1.json
  def destroy
    @docenza_sezione_materia.destroy
    respond_to do |format|
      format.html { redirect_to sezioni_url, notice: 'Docenza sezione materia was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_docenza_sezione_materia
      @docenza_sezione_materia = DocenzaSezioneMateria.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def docenza_sezione_materia_params
      params.require(:docenza_sezione_materia).permit(:docenza_id, :sezione_id, :materia_id)
    end
end
