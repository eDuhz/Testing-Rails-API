class ComboboxesController < ApplicationController
  before_action :set_combobox, only: [:show, :update, :destroy]

  # GET /comboboxes
  def index
    @comboboxes = Combobox.all

    render json: @comboboxes, include: [:kind, :phones, :address]
  end

  # GET /comboboxes/1
  def show
    render json: @combobox, include: [:kind, :phones, :address]
  end

  # POST /comboboxes
  def create
    @combobox = Combobox.new(combobox_params)

    if @combobox.save
      render json: @combobox, include: [:kind, :phones, :address], status: :created, location: @combobox
    else
      render json: @combobox.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /comboboxes/1
  def update
    if @combobox.update(combobox_params)
      render json: @combobox, include: [:kind, :phones, :address]
    else
      render json: @combobox.errors, status: :unprocessable_entity
    end
  end

  # DELETE /comboboxes/1
  def destroy
    @combobox.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_combobox
      @combobox = Combobox.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def combobox_params
      params.require(:combobox).permit(
        :cnpj, :contract, 
        :campaign, :kind_id,
        phones_attributes: [:id, :number, :_destroy],
        address_attributes: [:id, :city, :street]
        )
    end
end
