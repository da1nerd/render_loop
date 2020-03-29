module Prism::Core
    # Contains time information about the current tick
    struct Tick
        @current_time : Float64
        getter frame_rate, frame_time, last_actual_frame_time, current_time, startup_time
        
        def initialize(@frame_time : Float64, @last_actual_frame_time : Float64, @startup_time : Float64)
            @current_time = Time.monotonic.total_seconds
        end
    end
end