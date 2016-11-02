class AmministrazioniController < ApplicationController
  before_action :set_amministrazione, only: [:show, :edit, :update, :destroy]

  def confirm_email
    amministrazione = Amministrazione.find_by_confirm_token(params[:id])
    if amministrazione
      amministrazione.email_activate
      flash[:success] = "Welcome! Your email has been confirmed.
      Please sign in to continue."
      redirect_to loginamministrazione_url
    else
      flash[:error] = "Sorry. User does not exist"
      redirect_to root_url
    end
  end

  def menu
  end

  # GET /amministrazioni
  # GET /amministrazioni.json
  def index
    @amministrazioni = Amministrazione.all
  end

  # GET /amministrazioni/1
  # GET /amministrazioni/1.json
  def show
  end

  # GET /amministrazioni/new
  def new
    @amministrazione = Amministrazione.new
  end

  # GET /amministrazioni/1/edit
  def edit
  end

  # POST /amministrazioni
  # POST /amministrazioni.json
  def create
    @amministrazione = Amministrazione.new(amministrazione_params)

    respond_to do |format|
      if @amministrazione.save
        AmministrazioneMailer.registration_confirmation(@amministrazione).deliver_now
        format.html { redirect_to @amministrazione, notice: 'Amministrazione was successfully created.' }
        format.json { render :show, status: :created, location: @amministrazione }
      else
        format.html { render :new }
        format.json { render json: @amministrazione.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /amministrazioni/1
  # PATCH/PUT /amministrazioni/1.json
  def update
    respond_to do |format|
      if @amministrazione.update(amministrazione_params)
        format.html { redirect_to @amministrazione, notice: 'Amministrazione was successfully updated.' }
        format.json { render :show, status: :ok, location: @amministrazione }
      else
        format.html { render :edit }
        format.json { render json: @amministrazione.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /amministrazioni/1
  # DELETE /amministrazioni/1.json
  def destroy
    @amministrazione.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Amministrazione was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_amministrazione
      @amministrazione = Amministrazione.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def amministrazione_params
      params.require(:amministrazione).permit(:cf, :nome, :cognome, :indirizzo, :cittaresidenza, :cittanascita, :datanascita, :email, :password, :titolo, :password_confirmation)
    end
end
