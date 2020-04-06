require "./spec_helper"

describe RenderLoop::LoopHarness do
  it "creates a loop harness without blowing up" do
    h = RenderLoop::LoopHarness.new(60f64, [TestGame.new.as RenderLoop::Engine])
    h.start(TestWindow.new)
  end
end
