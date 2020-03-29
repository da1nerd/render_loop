require "./spec_helper"

describe Prism::Core::LoopHarness do
  it "creates a loop harness without blowing up" do
    h = Prism::Core::LoopHarness.new(60f64, [TestGame.new.as Prism::Core::Engine])
    h.start(TestWindow.new)
  end
end
