require File.expand_path("../../../spec_helper", __FILE__)

describe Admin::SeatingTypesController do
  dataset :seating_types

  before :each do
    ActionController::Routing::Routes.reload
  end

  it "should be an ResourceController" do
    controller.should be_kind_of(Admin::ResourceController)
  end

  it "should handle SeatingTypes" do
    controller.class.model_class.should == SeatingType
  end
end
