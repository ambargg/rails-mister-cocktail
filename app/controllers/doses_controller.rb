class DosesController < ApplicationController
  def new
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    ingredient = Ingredient.find(params[:dose][:ingredient_id])
    @dose.cocktail = @cocktail
    @dose.ingredient = ingredient

    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    dose = Dose.find(params[:id])
    cocktail = dose.cocktail
    dose.destroy
    redirect_to cocktail_path(cocktail)
  end

  private

  def set_dose
    @dose = Dose.find(params[:cocktail_id])
  end

  def dose_params
    params.require(:dose).permit(:description, :cocktail_id, :ingredent_id)
  end
end
