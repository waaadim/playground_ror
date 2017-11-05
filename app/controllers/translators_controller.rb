class TranslatorsController < ApplicationController
  include TranslatorsHelper
  before_action :set_translator, only: %i[show edit update destroy]

  def index
    @translators = Translator.all
  end

  def show; end

  def new
    # TODO: pass paramas[:source] instead of hardcoded url
    @translator = build_translator_from_parsed_data('https://www.proz.com/profile/52171')
  end

  def edit; end

  def create
    @translator = Translator.new(translator_params)

    respond_to do |format|
      if @translator.save
        format.html { redirect_to @translator, notice: 'Translator was successfully created.' }
        format.json { render :show, status: :created, location: @translator }
      else
        format.html { render :new }
        format.json { render json: @translator.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @translator.update(translator_params)
        format.html { redirect_to @translator, notice: 'Translator was successfully updated.' }
        format.json { render :show, status: :ok, location: @translator }
      else
        format.html { render :edit }
        format.json { render json: @translator.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @translator.destroy
    respond_to do |format|
      format.html { redirect_to translators_url, notice: 'Translator was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_translator
    @translator = Translator.find(params[:id])
  end

  def translator_params
    params.require(:translator).permit(
      :first_name,
      :last_name,
      :source,
      :country_id,
      language_ids: []
    )
  end
end
