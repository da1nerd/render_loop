module Prism::Core
  # Manages the main rendering loop
  # TODO: put rendering and state in their own threads.
  class LoopHarness
    @frame_time : Float64
    @is_running : Bool

    def initialize(frame_rate : Float64, @tickers : Array(Tickable))
      @is_running = false
      @frame_time = 1.0f64 / frame_rate
    end

    # Signals the loop to begin running in the *window*
    # This should be ran inside your graphics context otherwise you will receive an error
    # This is a noop if the loop is already running.
    def start(window : Window)
      return if r = @is_running == true
      self.run(window)
    end

    # Signals the loop to finish up and stop, and the graphics context to shut down.
    def stop
      @is_running = false
    end

    # Executed before each tick in the main loop.
    # This allows the graphics context to perform operations if necessary.
    def on_tick(&block)
      @on_tick_callback = block
    end

    # Executed before each render in the main loop.
    # This allows the graphics context to perform operations if necessary.
    def on_render(&block)
      @on_render_callback = block
    end

    # Sets up the main loop
    # This is ran inside the graphics context
    private def run(window : Window)
      return if @is_running
      @is_running = true

      input = Input.new(window)

      frames = 0
      frame_counter = 0
      @tickers.each do |t|
        t.startup
      end

      last_time = Time.monotonic.total_seconds
      unprocessed_time : Float64 = 0.0

      while running = @is_running
        should_render = false
        start_time = Time.monotonic.total_seconds
        passed_time = start_time - last_time # how long the previous frame took
        last_time = start_time

        unprocessed_time += passed_time
        frame_counter += passed_time

        while unprocessed_time > @frame_time
          should_render = true
          unprocessed_time -= @frame_time

          if callback = @on_tick_callback
            callback.call
          end

          if window.should_close?
            stop()
          end

          @tickers.each do |t|
            t.tick(@frame_time, input)
          end
          input.tick

          # log frame rate
          if (frame_counter >= 1.0)
            # puts "fps: #{frames}"
            frames = 0
            frame_counter = 0
          end
        end

        if should_render
          if callback = @on_render_callback
            callback.call
          end
          @tickers.each do |t|
            t.render
          end
          window.swap_buffers
          @tickers.each do |t|
            t.flush
          end
          frames += 1
        else
          # sleep for 1 millisecond
          sleep(Time::Span.new(nanoseconds: 1000000))
        end
      end

      @tickers.each do |t|
        t.shutdown
      end
      window.destroy
    end
  end
end
