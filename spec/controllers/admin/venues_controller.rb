require File.expand_path("../../../spec_helper", __FILE__)

describe Admin::VenuesController do
  dataset :venues

  before :each do
    ActionController::Routing::Routes.reload
  end

  it "should be an ResourceController" do
    controller.should be_kind_of(Admin::ResourceController)
  end

  it "should handle Venues" do
    controller.class.model_class.should == Venue
  end
end
