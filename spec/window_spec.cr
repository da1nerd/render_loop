require "./spec_helper"

describe RenderLoop::Window do
  # TODO: Write tests

  describe "#keys" do
    it "correctly returns an array of Key values" do
      w = TestWindow.new
      w.keys.is_a?(Array(Key)).should eq(true)
    end
  end

  describe "#mouse_buttons" do
    it "correctly returns an array of MouseButton values" do
      w = TestWindow.new
      w.mouse_buttons.is_a?(Array(MouseButton)).should eq(true)
    end
  end
end
