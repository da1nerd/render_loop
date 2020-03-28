module Prism::Core
  alias Size = {width: Float64, height: Float64}
  alias Position = {x: Float64, y: Float64}

  struct Cursor
    property position, visible

    def initialize(@position : Position, @visible : Bool)
    end
  end

  # Produces an abstraction around a window object
  # so you can use any window context you want.
  # The generics `Key` and `MouseButton` are enums
  # that define the available values.
  abstract class Window(Key, MouseButton)
    abstract def should_close? : Bool
    abstract def size : Size
    abstract def size(s : Size)
    abstract def render
    abstract def key_pressed?(k : Key) : Bool
    abstract def mouse_button_pressed?(b : MouseButton) : Bool
    abstract def cursor : Cursor
    abstract def cursor(c : Cursor)
    def keys : Array(Key)
      Key.values
    end
    def mouse_buttons : Array(MouseButton)
      MouseButton.values
    end
    abstract def swap_buffers
    abstract def destroy
  end
end
