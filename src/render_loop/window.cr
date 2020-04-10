module RenderLoop
  # Produces an abstraction around a window object
  # so you can use any window context you want.
  # The generics `Key` and `MouseButton` are enums
  # that define the available values.
  # TODO: maybe pass in the cursor as a generic as well so we we can reduce boilerplate.
  abstract class Window(Key, MouseButton)
    abstract def startup
    abstract def should_close? : Bool
    abstract def size : Size
    abstract def size(s : Size)
    # This gives the window an opportunity to paint to the screen
    abstract def render
    abstract def key_pressed?(k : Key) : Bool
    abstract def mouse_button_pressed?(b : MouseButton) : Bool
    abstract def cursor_position : RenderLoop::Position
    abstract def cursor_position=(position : RenderLoop::Position)
    # abstract def cursor_visible? : Bool
    abstract def cursor_visible=(visible : Bool)

    def keys : Array(Key)
      Key.values
    end

    def mouse_buttons : Array(MouseButton)
      MouseButton.values
    end

    abstract def destroy
  end
end
