class Api::V1::ReunionsController < ApplicationController
before_action :set_reunion, only: %i[ show update destroy ]

  # GET /reunions
  # GET /reunions.json
  def index
    @reunions = Reunion.all
    limit = params[:_limit]

    if limit.present?
      limit = limit.to_i
      @reunions = @reunions.last(limit)
    end
    render json: @reunions.reverse
  end

  # GET /reunions/1
  # GET /reunions/1.json
  def show
    @reunion = Reunion.find(params[:id])
    render json: @reunion
  end

  # POST /reunions/new
  # POST /reunions/new.json
  def new_from_front
    categorie_reunion = CategorieReunion.find(params[:categorie_reunion_id])
    @reunion = Reunion.new(reunion_params)
    @reunion.categorie_reunion = categorie_reunion

    if @reunion.save
      render :show, status: :created, location: @reunion
    else
      render json: @reunion.errors, status: :unprocessable_entity
    end
  end

  # POST /reunions
  # POST /reunions.json
  def create
    @reunion = Reunion.new(reunion_params)
    #@reunion.ouverte = true

    if @reunion.save
      render :show, status: :created, location: @reunion
    else
      render json: @reunion.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /reunions/1
  # PATCH/PUT /reunions/1.json
  def update
    if @reunion.update(reunion_params)
      render :show, status: :ok, location: @reunion
    else
      render json: @reunion.errors, status: :unprocessable_entity
    end
  end

  def today_reunions
    @today_reunions = Reunion.today
    render json: @today_reunions
  end

  # DELETE /reunions/1
  # DELETE /reunions/1.json
  def destroy
    @reunion.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reunion
      @reunion = Reunion.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def reunion_params
      params.require(:reunion).permit(:id, :dateReunion, :heureDebut, :heureFin, :ouverte, :commentaire)
    end
end
