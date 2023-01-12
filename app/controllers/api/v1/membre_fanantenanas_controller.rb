class Api::V1::MembreFanantenanasController < ApplicationController
before_action :set_membre_fanantenana, only: %i[ show update destroy ]

  # GET /membre_fanantenanas
  # GET /membre_fanantenanas.json
  def index
    @membre_fanantenanas = MembreFanantenana.all
    limit = params[:_limit]

    if limit.present?
      limit = limit.to_i
      @membre_fanantenanas = @membre_fanantenanas.last(limit)
    end
    render json: @membre_fanantenanas.reverse
  end

  # GET /membre_fanantenanas/1
  # GET /membre_fanantenanas/1.json
  def show
  	@membre_fanantenana = MembreFanantenana.find(params[:id])
  	render json: @membre_fanantenana
  end

  # POST /membre_fanantenanas
  # POST /membre_fanantenanas.json
  def create
    @membre_fanantenana = MembreFanantenana.new(membre_fanantenana_params)

    if @membre_fanantenana.save
      render :show, status: :created
    else
      render json: @membre_fanantenana.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /membre_fanantenanas/1
  # PATCH/PUT /membre_fanantenanas/1.json
  def update
    if @membre_fanantenana.update(membre_fanantenana_params)
      render :show, status: :ok, location: @membre_fanantenana
    else
      render json: @membre_fanantenana.errors, status: :unprocessable_entity
    end
  end

  # DELETE /membre_fanantenanas/1
  # DELETE /membre_fanantenanas/1.json
  def destroy
    @membre_fanantenana.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_membre_fanantenana
      @membre_fanantenana = MembreFanantenana.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def membre_fanantenana_params
      params.require(:membre_fanantenana).permit(:id, :matricule, :nom, :prenom, :sexe, :date_naissance,
        :adresse, :telephone, :photo_profile, :telephone_parent, :niveau_etude, :annee_etude, :profession, :date_adhesion,
        :don, :etude, :annee_adhesion, :numero_fpvm, :status_fpvm, :membre_actif)
    end
end