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
      params.require(:presence).permit(:title, :completed)
    end
end