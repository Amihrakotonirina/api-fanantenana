class Api::V1::CategorieReunionsController < ApplicationController
before_action :set_categorie_reunion, only: %i[ show update destroy ]

  # GET /categorie_reunions
  # GET /categorie_reunions.json
  def index
    @categorie_reunions = CategorieReunion.all
    limit = params[:_limit]

    if limit.present?
      limit = limit.to_i
      @categorie_reunions = @categorie_reunions.last(limit)
    end
    render json: @categorie_reunions.reverse
  end

  # GET /categorie_reunions/1
  # GET /categorie_reunions/1.json
  def show
  end

  # POST /categorie_reunions
  # POST /categorie_reunions.json
  def create
    @categorie_reunion = CategorieReunion.new(categorie_reunion_params)

    if @categorie_reunion.save
      render :show, status: :created, location: @categorie_reunion
    else
      render json: @categorie_reunion.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /categorie_reunions/1
  # PATCH/PUT /categorie_reunions/1.json
  def update
    if @categorie_reunion.update(categorie_reunion_params)
      render :show, status: :ok, location: @categorie_reunion
    else
      render json: @categorie_reunion.errors, status: :unprocessable_entity
    end
  end

  # DELETE /categorie_reunions/1
  # DELETE /categorie_reunions/1.json
  def destroy
    @categorie_reunion.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_categorie_reunion
      @categorie_reunion = CategorieReunion.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def categorie_reunion_params
      params.require(:categorie_reunion).permit(:title, :completed)
    end
end
