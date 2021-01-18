module RenderLoop
  # Provides a helpful wrapper over window input.
  # TODO: Most of this is implementation specific and shouldn't be part of this lib.

  class Input(Key, MouseButton)
    @last_mouse = {} of MouseButton => Bool
    @last_keys = {} of Key => Bool

    def initialize(@window : RenderLoop::Window(Key, MouseButton))
    end

    # Processes the window input during each update tick
    def tick
      Key.each do |k|
        @last_keys[k] = self.get_key(k)
      end
      MouseButton.each do |b|
        @last_mouse[b] = self.get_mouse(b)
      end
    end

    # Returns an array of all keys
    def keys
      @last_keys.keys
    end

    # Returns an array of all buttons
    def mouse_buttons
      @last_mouse.keys
    end

    # Returns an array of buttons that are currently pressed
    def get_mouse_buttons
      buttons = [] of MouseButton
      @last_mouse.keys.each do |k|
        if @last_mouse[k]
          buttons.push(k)
        end
      end
      return buttons
    end

    # Checks if the key is currently down
    def get_key(key_code : Key) : Bool
      return @window.key_pressed?(key_code.as(Key))
    end

    # Checks if the key was pressed in this frame
    def get_key_pressed(key_code : Key) : Bool
      return get_key(key_code) && (!@last_keys.has_key?(key_code) || !@last_keys[key_code])
    end

    # Returns an array of keys that are currently pressed
    def get_keys : Array(Key)
      keys = [] of Key
      @last_keys.keys.each do |k|
        if @last_keys[k]
          keys.push(k)
        end
      end
      return keys
    end

    # Returns the size of the window
    def window_size : NamedTuple(height: Int32, width: Int32)
      @window.size
    end

    # Checks if the key was released in this frame
    def get_key_released(key_code : Key) : Bool
      # TODO: check that looking up the key from last keys is not null
      return !get_key(key_code) && @last_keys.has_key?(key_code) && @last_keys[key_code]
    end

    # Check if the mouse button is currently down
    def get_mouse(mouse_button : MouseButton) : Bool
      return @window.mouse_button_pressed?(mouse_button.as(MouseButton))
    end

    # Checks if the mouse button was pressed in this frame
    def get_mouse_pressed(mouse_button : MouseButton) : Bool
      return get_mouse(mouse_button) && (!@last_mouse.has_key?(mouse_button) || !@last_mouse[mouse_button])
    end

    # Checks if the mouse button was released in this frame
    def get_mouse_released(mouse_button : MouseButton) : Bool
      return !get_mouse(mouse_button) && @last_mouse.has_key?(mouse_button) && @last_mouse[mouse_button]
    end

    # Returns the position of the mouse
    def get_mouse_position : RenderLoop::Position
      @window.cursor_position
    end

    # Sets the mouse position within the window
    def set_mouse_position(position : RenderLoop::Position)
      @window.cursor_position = position
    end

    # Controls the cursor visibility within the window
    def set_cursor(enabled : Bool)
      @window.cursor_visible = enabled
    end

    # Returns the center of the window
    def get_center : RenderLoop::Position
      return {
        x: @window.size[:width] / 2.0f64,
        y: @window.size[:height] / 2.0f64,
      }
    end
  end
end
