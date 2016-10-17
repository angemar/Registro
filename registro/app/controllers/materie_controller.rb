class MaterieController < ApplicationController
  before_action :set_materia, only: [:show, :edit, :update, :destroy]

  # GET /materie
  # GET /materie.json
  def index
    @materie = Materia.all
  end

  # GET /materie/1
  # GET /materie/1.json
  def show
  end

  # GET /materie/new
  def new
    @materia = Materia.new
  end

  # GET /materie/1/edit
  def edit
  end

  # POST /materie
  # POST /materie.json
  def create
    @materia = Materia.new(materia_params)

    respond_to do |format|
      if @materia.save
        format.html { redirect_to @materia, notice: 'Materia was successfully created.' }
        format.json { render :show, status: :created, location: @materia }
      else
        format.html { render :new }
        format.json { render json: @materia.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /materie/1
  # PATCH/PUT /materie/1.json
  def update
    respond_to do |format|
      if @materia.update(materia_params)
        format.html { redirect_to @materia, notice: 'Materia was successfully updated.' }
        format.json { render :show, status: :ok, location: @materia }
      else
        format.html { render :edit }
        format.json { render json: @materia.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /materie/1
  # DELETE /materie/1.json
  def destroy
    @materia.destroy
    respond_to do |format|
      format.html { redirect_to materie_url, notice: 'Materia was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_materia
      @materia = Materia.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def materia_params
      params.require(:materia).permit(:nome)
    end
end
