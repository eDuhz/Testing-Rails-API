class AddKindToComboboxesController < ApplicationController
  before_action :set_add_kind_to_combobox, only: [:show, :update, :destroy]

  # GET /add_kind_to_comboboxes
  def index
    @add_kind_to_comboboxes = AddKindToCombobox.all

    render json: @add_kind_to_comboboxes
  end

  # GET /add_kind_to_comboboxes/1
  def show
    render json: @add_kind_to_combobox
  end

  # POST /add_kind_to_comboboxes
  def create
    @add_kind_to_combobox = AddKindToCombobox.new(add_kind_to_combobox_params)

    if @add_kind_to_combobox.save
      render json: @add_kind_to_combobox, status: :created, location: @add_kind_to_combobox
    else
      render json: @add_kind_to_combobox.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /add_kind_to_comboboxes/1
  def update
    if @add_kind_to_combobox.update(add_kind_to_combobox_params)
      render json: @add_kind_to_combobox
    else
      render json: @add_kind_to_combobox.errors, status: :unprocessable_entity
    end
  end

  # DELETE /add_kind_to_comboboxes/1
  def destroy
    @add_kind_to_combobox.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_add_kind_to_combobox
      @add_kind_to_combobox = AddKindToCombobox.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def add_kind_to_combobox_params
      params.require(:add_kind_to_combobox).permit(:kind_id)
    end
end
