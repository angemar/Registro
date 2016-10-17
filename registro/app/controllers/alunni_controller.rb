class AlunniController < ApplicationController
  before_action :set_alunno, only: [:show, :edit, :update, :destroy]

  # GET /alunni
  # GET /alunni.json
  def index
    @alunni = Alunno.all
  end

  # GET /alunni/1
  # GET /alunni/1.json
  def show
  end

  # GET /alunni/new
  def new
    @alunno = Alunno.new
  end

  # GET /alunni/1/edit
  def edit
  end

  # POST /alunni
  # POST /alunni.json
  def create
    @alunno = Alunno.new(alunno_params)

    respond_to do |format|
      if @alunno.save
        format.html { redirect_to @alunno, notice: 'Alunno was successfully created.' }
        format.json { render :show, status: :created, location: @alunno }
      else
        format.html { render :new }
        format.json { render json: @alunno.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /alunni/1
  # PATCH/PUT /alunni/1.json
  def update
    respond_to do |format|
      if @alunno.update(alunno_params)
        format.html { redirect_to @alunno, notice: 'Alunno was successfully updated.' }
        format.json { render :show, status: :ok, location: @alunno }
      else
        format.html { render :edit }
        format.json { render json: @alunno.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /alunni/1
  # DELETE /alunni/1.json
  def destroy
    @alunno.destroy
    respond_to do |format|
      format.html { redirect_to alunni_url, notice: 'Alunno was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_alunno
      @alunno = Alunno.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def alunno_params
      params.require(:alunno).permit(:cf, :nome, :cognome, :indirizzo, :cittaresidenza, :cittanascita, :datanascita, :email, :password, :password_confirmation)
    end
end
