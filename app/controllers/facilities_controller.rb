class FacilitiesController < AuthenticatedBaseController
  def index
    @tab = if params[:tab].present?
             params[:tab].to_sym
           else
             :cars
           end
  end
end
