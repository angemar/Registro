class AssenzeController < ApplicationController
  before_action :set_assenza, only: [:show, :edit, :update, :destroy]

  # GET /assenze
  # GET /assenze.json
  def index
    @assenze = Assenza.all
  end

  # GET /assenze/1
  # GET /assenze/1.json
  def show
  end

  # GET /assenze/new
  def new
    @assenza = Assenza.new
  end

  # GET /assenze/1/edit
  def edit
  end

  # POST /assenze
  # POST /assenze.json
  def create
    @assenza = Assenza.new(assenza_params)

    respond_to do |format|
      if @assenza.save
        format.html { redirect_to @assenza, notice: 'Assenza was successfully created.' }
        format.json { render :show, status: :created, location: @assenza }
      else
        format.html { render :new }
        format.json { render json: @assenza.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /assenze/1
  # PATCH/PUT /assenze/1.json
  def update
    respond_to do |format|
      if @assenza.update(assenza_params)
        format.html { redirect_to @assenza, notice: 'Assenza was successfully updated.' }
        format.json { render :show, status: :ok, location: @assenza }
      else
        format.html { render :edit }
        format.json { render json: @assenza.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assenze/1
  # DELETE /assenze/1.json
  def destroy
    @assenza.destroy
    respond_to do |format|
      format.html { redirect_to assenze_url, notice: 'Assenza was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assenza
      @assenza = Assenza.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def assenza_params
      params.require(:assenza).permit(:date, :alunno_id, :amministrazione_id)
    end
end
