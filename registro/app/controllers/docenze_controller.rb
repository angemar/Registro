class DocenzeController < ApplicationController
  before_action :set_docenza, only: [:show, :edit, :update, :destroy]
  before_filter :is_permitted, only: [:edit, :update, :destroy]

  def is_permitted
    if session[:role] == "alunno"
      redirect_to :back, :alert => "Operazione non permessa"
    end
  end

  def confirm_email
    docenza = Docenza.find_by_confirm_token(params[:id])
    if docenza
      docenza.email_activate
      flash[:success] = "Welcome! Your email has been confirmed.
      Please sign in to continue."
      redirect_to logindocenza_url
    else
      flash[:error] = "Sorry. User does not exist"
      redirect_to root_url
    end
  end

  def menu
  end

  # GET /docenze
  # GET /docenze.json
  def index
    @docenze = Docenza.all
  end

  # GET /docenze/1
  # GET /docenze/1.json
  def show
  end

  # GET /docenze/new
  def new
    @docenza = Docenza.new
  end

  # GET /docenze/1/edit
  def edit
  end

  # POST /docenze
  # POST /docenze.json
  def create
    @docenza = Docenza.new(docenza_params)

    respond_to do |format|
      if @docenza.save
        DocenzaMailer.registration_confirmation(@docenza).deliver_now
        format.html { redirect_to @docenza, notice: 'Docenza was successfully created.' }
        format.json { render :show, status: :created, location: @docenza }
      else
        format.html { render :new }
        format.json { render json: @docenza.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /docenze/1
  # PATCH/PUT /docenze/1.json
  def update
    respond_to do |format|
      @docenza.user=session[:role]
      if session[:role] != "docenza"
		    docenza_params.delete(:email)
		    docenza_params.delete(:password)
		    docenza_params.delete(:password_confirmation)
      end
      if @docenza.update(docenza_params)
        format.html { redirect_to @docenza, notice: 'Docenza was successfully updated.' }
        format.json { render :show, status: :ok, location: @docenza }
      else
        format.html { render :edit }
        format.json { render json: @docenza.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /docenze/1
  # DELETE /docenze/1.json
  def destroy
    @docenza.destroy
    respond_to do |format|
      format.html { redirect_to docenze_url, notice: 'Docenza was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_docenza
      @docenza = Docenza.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def docenza_params
      params.require(:docenza).permit(:cf, :nome, :cognome, :indirizzo, :cittaresidenza, :cittanascita, :datanascita, :curriculum, :email, :password, :password_confirmation)
    end
end
