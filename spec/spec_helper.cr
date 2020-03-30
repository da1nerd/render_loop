require "spec"
require "../src/prism-core"

enum Key
  Key1
  Key2
end

enum MouseButton
  Button1
  Button2
end

class TestGame < Prism::Core::Engine
  def tick(tick : Prism::Core::Tick, input : Prism::Core::Input)
  end
end

class TestWindow < Prism::Core::Window(Key, MouseButton)
  def should_close? : Bool
    false
  end

  def size : Prism::Core::Size
    {width: 1f64, height: 1f64}
  end

  def size(s : Prism::Core::Size)
  end

  def render
  end

  def key_pressed?(k : Key) : Bool
    false
  end

  def mouse_button_pressed?(b : MouseButton) : Bool
    false
  end

  def cursor_position=(position : Prism::Core::Position)
  end

  def cursor_position : Prism::Core::Position
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
