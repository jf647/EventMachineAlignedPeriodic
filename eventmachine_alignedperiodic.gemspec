Gem::Specification.new do |s|
    s.name = 'eventmachine_alignedperiodic'
    s.version = '2.0.0'
    s.date = '2013-04-04'
    s.summary = 'EVMA Aligned Periodic Task Runner'
    s.description = 'a periodic event runner for eventmachine that aligns to an interval'
    s.add_dependency( 'eventmachine', '>= 1.0.0' )
    s.authors = ['James FitzGibbon']
    s.email = 'james@nadt.net'
    s.files = ['lib/eventmachine_alignedperiodic.rb']
end
