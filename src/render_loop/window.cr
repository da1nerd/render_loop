module RenderLoop
  # Produces an abstraction around a window object
  # so you can use any window context you want.
  # The generics `Key` and `MouseButton` are enums
  # that define the available values.
  # TODO: maybe pass in the cursor as a generic as well so we we can reduce boilerplate.
  abstract class Window(Key, MouseButton)
    abstract def startup
    abstract def should_close? : Bool
    abstract def render
    abstract def destroy

    # TODO: This is implementation specific and shouldn't be part of this lib.
    abstract def size : RenderLoop::Size
    # TODO: This is implementation specific and shouldn't be part of this lib.
    abstract def size(s : RenderLoop::Size)
    # TODO: This is implementation specific and shouldn't be part of this lib.
    abstract def key_pressed?(k : Key) : Bool
    # TODO: This is implementation specific and shouldn't be part of this lib.
    abstract def mouse_button_pressed?(b : MouseButton) : Bool
    # TODO: This is implementation specific and shouldn't be part of this lib.
    abstract def cursor_position : RenderLoop::Position
    # TODO: This is implementation specific and shouldn't be part of this lib.
    abstract def cursor_position=(position : RenderLoop::Position)
    # TODO: This is implementation specific and shouldn't be part of this lib.
    # abstract def cursor_visible? : Bool
    # TODO: This is implementation specific and shouldn't be part of this lib.
    abstract def cursor_visible=(visible : Bool)

    # TODO: This is implementation specific and shouldn't be part of this lib.
    def keys : Array(Key)
      Key.values
    end

    # TODO: This is implementation specific and shouldn't be part of this lib.
    def mouse_buttons : Array(MouseButton)
      MouseButton.values
    end
  end
end
