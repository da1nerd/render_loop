module Prism::Core
  alias Size = {width: Float64, height: Float64}
  alias Position = {x: Float64, y: Float64}
  alias Cursor = {position: Position, visible: Boolean}
  # TODO: how do I make this generic?
  enum Key
    Key1
    Key2
  end
  # TODO: how do I make this generic?
  enum MouseButton
    Button1
    Button2
  end

  # Produces an abstraction around a window object
  # so you can use any window context you want.
  abstract class Window
    abstract def should_close? : Boolean
    abstract def size : Size
    abstract def size(s : Size)
    abstract def render
    abstract def key_pressed? : Boolean
    abstract def mouse_button_pressed? : Boolean
    abstract def cursor : Cursor
    abstract def cursor(c : Cursor)
    abstract def keys : Key # TODO: use macro to insert enum type
    abstract def mouse_buttons : MouseButton # TODO: use macro to insert enum type

  end
end
