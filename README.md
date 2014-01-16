MiniProf
========

A quick-and-dirty lightweight profiler that allows you to measure the
various steps in walltime.  It is much easier to control and interpret
the output from miniprof compared to raw profiling data, which can
often overwhelm you.

Calling MiniProf.profile returns a block containing a MiniProf
instance.  This instance will record the time for each step when you
feed in a step description via the << operator.

This tool is indented for development only.  We probably don't ever
want to commit active MiniProf code and/or release it to production.

Sample usage
------------

    johnmudhead:pikimal grant$ cat mini_prof_test.rb 
    def test_method
      MiniProf.profile do |tick|
        #simulated possibly long operation
        sleep 1
        tick << "Step one complete"
    
        # simulated really long operation
        sleep 5
        tick << "Step two complete"
      end
    end
  
    test_method
    johnmudhead:pikimal grant$ rails console < mini_prof_test.rb 
    Loading development environment (Rails 3.0.7)

    ...

    Tick: (0 ms since last, 0 ms since start) Started mini_prof...
    Tick: (1000 ms since last, 1000 ms since start) Step one complete
    Tick: (5000 ms since last, 6000 ms since start) Step two complete
    Tick: (0 ms since last, 6000 ms since start) Ended mini_prof...
     => nil 
    ruby-1.9.2-p0 > 

### Verifying the software

The gem is signed with
[rubygems-openpgp](https://github.com/grant-olson/rubygems-openpgp).
Assuming you have rubygems-openpgp configured, you can verify the
software:

    gem install bmf --verify

More details are available at the [rubygems-openpgp project
page](https://github.com/grant-olson/rubygems-openpgp).

Signing Key:

    pub   2048R/E3B5806F 2010-01-11 [expires: 2014-01-03]
          Key fingerprint = A530 C31C D762 0D26 E2BA  C384 B6F6 FFD0 E3B5 806F
    uid                  Grant T. Olson (Personal email) <kgo at grant-olson dot net>
    sub   2048R/6A8F7CF6 2010-01-11 [expires: 2014-01-03]
    sub   2048R/A18A54D6 2010-03-01 [expires: 2014-01-03]
    sub   2048R/D53982CE 2010-08-31 [expires: 2014-01-03]
