class Api::V1::PresencesController < ApplicationController
before_action :set_presence, only: %i[ show update destroy ]

  # GET /presences
  # GET /presences.json
  def index
    @presences = Presence.all
    limit = params[:_limit]

    if limit.present?
      limit = limit.to_i
      @presences = @presences.last(limit)
    end
    render json: @presences.reverse
  end

  # GET /presences/1
  # GET /presences/1.json
  def show
  end

  # POST /presences/new/:membre_fanantenana_id/:reunion_id
  # POST /presences.json
  def new_from_front

    reunion_id = params[:reunion_id].to_i
    membre_fanantenana_id = params[:membre_fanantenana_id].to_i
    tempPresence = params[:presence]

    reunion = Reunion.find reunion_id
    membre_fanantenana = MembreFanantenana.find membre_fanantenana_id

    @presence = Presence.new(presence_params)
    @presence.reunion = reunion
    @presence.membre_fanantenana = membre_fanantenana

    if @presence.save
      render :show, status: :created, location: @presence
    else
      render json: @presence.errors, status: :unprocessable_entity
    end
  end

  # POST /presences
  # POST /presences.json
  def create
    @presence = Presence.new(presence_params)

    if @presence.save
      render :show, status: :created, location: @presence
    else
      render json: @presence.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /presences/1
  # PATCH/PUT /presences/1.json
  def update
    if @presence.update(presence_params)
      render :show, status: :ok, location: @presence
    else
      render json: @presence.errors, status: :unprocessable_entity
    end
  end

  # DELETE /presences/1
  # DELETE /presences/1.json
  def destroy
    @presence.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_presence
      @presence = Presence.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def presence_params
      #tokony averina jerena
      params.require(:presence).permit(:id, :retard, :heureEntree, :heureSortie, :note)
    end
end