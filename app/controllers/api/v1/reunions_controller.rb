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
  end

  # POST /reunions
  # POST /reunions.json
  def create
    @reunion = Reunion.new(reunion_params)

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
      params.require(:reunion).permit(:date_reunion, :heure_debut, :heure_fin, :ouverte, :commentaire)
    end
end
