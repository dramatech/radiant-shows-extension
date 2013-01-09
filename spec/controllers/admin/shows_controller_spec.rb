require File.expand_path("../../../spec_helper", __FILE__)

describe Admin::ShowsController do

  before :each do
    ActionController::Routing::Routes.reload
  end

  it "should be a ResourceController" do
    controller.should be_kind_of(Admin::ResourceController)
  end

  it "should handle Shows" do
    controller.class.model_class.should == Show
  end
end
