class SezioniController < ApplicationController
  before_action :set_sezione, only: [:show, :edit, :update, :destroy]

  # GET /sezioni
  # GET /sezioni.json
  def index
    @sezioni = Sezione.all
  end

  # GET /sezioni/1
  # GET /sezioni/1.json
  def show
  end

  # GET /sezioni/new
  def new
    @sezione = Sezione.new
  end

  # GET /sezioni/1/edit
  def edit
  end

  # POST /sezioni
  # POST /sezioni.json
  def create
    @sezione = Sezione.new(sezione_params)

    respond_to do |format|
      if @sezione.save
        format.html { redirect_to @sezione, notice: 'Sezione was successfully created.' }
        format.json { render :show, status: :created, location: @sezione }
      else
        format.html { render :new }
        format.json { render json: @sezione.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sezioni/1
  # PATCH/PUT /sezioni/1.json
  def update
    respond_to do |format|
      if @sezione.update(sezione_params)
        format.html { redirect_to @sezione, notice: 'Sezione was successfully updated.' }
        format.json { render :show, status: :ok, location: @sezione }
      else
        format.html { render :edit }
        format.json { render json: @sezione.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sezioni/1
  # DELETE /sezioni/1.json
  def destroy
    @sezione.destroy
    respond_to do |format|
      format.html { redirect_to sezioni_url, notice: 'Sezione was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sezione
      @sezione = Sezione.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sezione_params
      params.require(:sezione).permit(:lettera, :numero)
    end
end
