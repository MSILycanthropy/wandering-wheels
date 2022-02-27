class CarsController < AuthenticatedBaseController
  def index
    @cars = @facility.cars
  end

  def edit
    @car = @facility.cars.find(params[:id])
  end

  def update
    @car = @facility.cars.find(params[:id])

    if @car.update(car_params)
      flash[:success] = 'Successfully updated!'
      render_flash
    else
      render turbo_stream: turbo_stream.replace('modal', partial: 'cars/modal_form', locals: { car: @car })
    end
  end

  private

  def car_params
    params.require(:car).permit(:make, :model, :year, :mileage, :color, :car_type, :doors, :transmission,
                                :license_plate, :rented)
  end
end
