module RenderLoop
  # Receives events from the main loop
  abstract class Engine
    # Called when the main loop is starting up.
    # Use this to set things up.
    def startup
    end

    # Called at each iteration of the main loop.
    # This is when game state should be updated.
    abstract def tick(tick : RenderLoop::Tick, input : RenderLoop::Input)

    # Called at intervals desigated by the configured frame rate.
    # This is used to render the scene.
    def render
    end

    # Called to perform cleanup operations after the sceen has been rendered.
    def flush
    end

    # Called when the application is shutting down.
    def shutdown
    end
  end
end
