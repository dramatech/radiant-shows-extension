class Admin::SeatingTypesController < Admin::ResourceController
  def create
    self.model = SeatingType.new(params[model_symbol])
    render :partial => "seating_type", :object => model,
      :locals => { :seating_type_counter => params[:seating_type_counter].to_i, :owner_model => params[:owner_model] }
  end
end
