require "crystglfw"

module Prism::Core
  # Manages the main rendering loop
  # TODO: this should manage the rendering in a single window.
  # So we should create the window and set up the loop inside it.
  # This should not create it's own window.
  #
  # TODO: put rendering and state in their own threads.
  class LoopHarness
    @frame_time : Float64
    @is_running : Bool

    def initialize(@width : Int32, @height : Int32, frame_rate : Float64, @title : String, @game : Game)
      @is_running = false
      @frame_time = 1.0f64 / frame_rate
    end

    # Signals the graphics context to start up, and the loop to begin running.
    def start
      return if r = @is_running == true
      CrystGLFW.run do
        self.run
      end
    end

    # Signals the loop to finish up and stop, and the graphics context to shut down.
    def stop
      @is_running = false
    end

    # Sets up the main loop
    private def run
      return if @is_running
      @is_running = true

      window = CrystGLFW::Window.new(title: @title, width: @width, height: @height)
      window.make_context_current

      input = Input.new(window)
      @rendering_engine = RenderingEngine.new

      frames = 0
      frame_counter = 0
      @game.init

      last_time = Time.monotonic.total_seconds
      unprocessed_time : Float64 = 0.0

      while running = @is_running
        should_render = false
        start_time = Time.monotonic.total_seconds
        passed_time = start_time - last_time # how long the previous frame took
        last_time = start_time

        unprocessed_time += passed_time
        frame_counter += passed_time

        while unprocessed_time > @frametime
          should_render = true

          unprocessed_time -= @frametime

          CrystGLFW.poll_events

          if window.should_close?
            stop()
          end

          @game.input(@frametime.to_f32, input)
          input.update
          @game.update(@frametime.to_f32)

          # log frame rate
          if (frame_counter >= 1.0)
            # puts "fps: #{frames}"
            frames = 0
            frame_counter = 0
          end
        end

        if should_render
          LibGL.viewport(0, 0, window.size[:width], window.size[:height])
          @game.render(rendering_engine)
          window.swap_buffers
          rendering_engine.flush
          frames += 1
        else
          # sleep for 1 millisecond
          sleep(Time::Span.new(nanoseconds: 1000000))
        end
      end

      window.destroy
    end
  end
end
