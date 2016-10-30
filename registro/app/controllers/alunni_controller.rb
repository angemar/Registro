class AlunniController < ApplicationController
  before_action :set_alunno, only: [:show, :edit, :update, :destroy]

  def confirm_email
    alunno = Alunno.find_by_confirm_token(params[:id])
    if alunno
      alunno.email_activate
      flash[:success] = "Welcome! Your email has been confirmed.
      Please sign in to continue."
      redirect_to loginalunno_url
    else
      flash[:error] = "Sorry. User does not exist"
      redirect_to root_url
    end
  end

  def menu
  end

  def elenco
    id=params[:sezione_id]
    @alunni=Alunno.where(sezione_id: id)
  end
  # GET /alunni
  # GET /alunni.json
  def index
    @alunni = Alunno.all
  end

  # GET /alunni/1
  # GET /alunni/1.json
  def show
    @alunno=Alunno.find(params[:id])
    sez_id=@alunno.sezione_id
    if sez_id != nil
      @sezione=Sezione.find(sez_id) 
    end
  end

  # GET /alunni/new
  def new
    @sezioni = Sezione.all
    @alunno = Alunno.new
  end

  # GET /alunni/1/edit
  def edit
    @sezioni = Sezione.all
  end

  # POST /alunni
  # POST /alunni.json
  def create
    @alunno = Alunno.new(alunno_params)
    @sezioni = Sezione.all
    respond_to do |format|
      if @alunno.save
        AlunnoMailer.registration_confirmation(@alunno).deliver_now
        format.html { redirect_to @alunno, notice: 'Alunno was successfully created. Confirm your email address to continue!' }
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
    @sezioni = Sezione.all
    respond_to do |format|
      @alunno.user=session[:role]
      if session[:role] != "alunno"
		    alunno_params.delete(:email)
		    alunno_params.delete(:password)
		    alunno_params.delete(:password_confirmation)
      end
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
      params.require(:alunno).permit(:cf, :nome, :cognome, :indirizzo, :cittaresidenza, :cittanascita, :datanascita, :email, :password, :password_confirmation, :sezione_id)
    end
end
