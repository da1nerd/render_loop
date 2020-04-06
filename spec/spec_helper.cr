require "spec"
require "../src/render_loop"

enum Key
  Key1
  Key2
end

enum MouseButton
  Button1
  Button2
end

class TestGame < RenderLoop::Engine
  def tick(tick : RenderLoop::Tick, input : RenderLoop::Input)
  end
end

class TestWindow < RenderLoop::Window(Key, MouseButton)
  def should_close? : Bool
    false
  end

  def size : RenderLoop::Size
    {width: 1f64, height: 1f64}
  end

  def size(s : RenderLoop::Size)
  end

  def render
  end

  def key_pressed?(k : Key) : Bool
    false
  end

  def mouse_button_pressed?(b : MouseButton) : Bool
    false
  end

  def cursor_position=(position : RenderLoop::Position)
  end

  def cursor_position : RenderLoop::Position
    {
      x: 1f64,
      y: 1f64,
    }
  end

  def cursor_visible=(visible : Bool)
  end

  def cursor_visible? : Bool
    true
  end

  def swap_buffers
  end

  def destroy
  end
end
