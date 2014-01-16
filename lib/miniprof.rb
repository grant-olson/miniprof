require "miniprof/version"

class MiniProf
  # Get the seconds since epoch.  using to_f provides sub-second
  # accuracy
  def seconds_since_epoch
    Time.now.to_f
  end

  # Initialize the profiler
  #
  # The optional marker will prefix each message, so you can
  # distingish the output of multiple profilers.
  def initialize marker="", opts={}
    @start_time = seconds_since_epoch
    @last_tick_time = @start_time
    @marker = marker
    @enabled = true
    @enabled = opts[:enabled] if opts.has_key?(:enabled)
  end

  # Main loop
  def profile &block
    self.<< "Started mini_prof..."
    return_value = yield self
    self.<< "Ended mini_prof..."
    return return_value
  end
  
  def seconds_to_ms seconds
    (seconds * 1000).to_i
  end

  # Print out a mesage indicating how long it's been since the last
  # step and since the start of profiling
  def << msg
    return if @enabled == false

    new_time = seconds_since_epoch
    since_start = seconds_to_ms(new_time - @start_time)
    since_last = seconds_to_ms(new_time - @last_tick_time)
    @last_tick_time = new_time

    msg = "Tick: (#{since_last} ms since last, #{since_start} ms since start) #{msg}"
    msg = @marker + " " + msg if !@marker.empty?
    puts msg
  end
  
  # Create a profiler object and execute it.  The optional marker will
  # print at the beginning of each line of output.
  def self.profile marker="",opts={}, &block
    mp = MiniProf.new marker, opts
    mp.profile &block
  end
  
end
