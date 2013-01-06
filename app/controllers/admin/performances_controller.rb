class Admin::PerformancesController < Admin::ResourceController
  def create
    self.model = Performance.new(params[model_symbol])
    render :partial => "performance", :object => model,
      :locals => { :performance_counter => params[:performance_counter].to_i }
  end
end
