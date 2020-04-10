module RenderLoop
  struct Cursor
    property position, visible

    def initialize(@position : RenderLoop::Position, @visible : Bool)
    end
  end
end
