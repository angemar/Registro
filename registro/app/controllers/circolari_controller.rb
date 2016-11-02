class CircolariController < ApplicationController
  before_action :set_circolare, only: [:show, :edit, :update, :destroy]
  before_filter :is_permitted, only: [:new, :edit, :update, :destroy]

  def is_permitted
    if session[:role] != "amministrazione"
      redirect_to :back, :alert => "Operazione non permessa"
    end
  end

  # GET /circolari
  # GET /circolari.json
  def index
    @circolari = Circolare.all
  end

  # GET /circolari/1
  # GET /circolari/1.json
  def show
  end

  # GET /circolari/new
  def new
    @circolare = Circolare.new
  end

  # GET /circolari/1/edit
  def edit
  end

  # POST /circolari
  # POST /circolari.json
  def create
    @circolare = Circolare.new(circolare_params)

    respond_to do |format|
      if @circolare.save
        format.html { redirect_to @circolare, notice: 'Circolare was successfully created.' }
        format.json { render :show, status: :created, location: @circolare }
      else
        format.html { render :new }
        format.json { render json: @circolare.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /circolari/1
  # PATCH/PUT /circolari/1.json
  def update
    respond_to do |format|
      if @circolare.update(circolare_params)
        format.html { redirect_to @circolare, notice: 'Circolare was successfully updated.' }
        format.json { render :show, status: :ok, location: @circolare }
      else
        format.html { render :edit }
        format.json { render json: @circolare.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /circolari/1
  # DELETE /circolari/1.json
  def destroy
    @circolare.destroy
    respond_to do |format|
      format.html { redirect_to circolari_url, notice: 'Circolare was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_circolare
      @circolare = Circolare.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def circolare_params
      params.require(:circolare).permit(:numero, :dataemissione, :titolo, :oggetto)
    end
end
