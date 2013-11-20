Gem::Specification.new do |s|
  s.name = "ruby-tm"
  s.version = "0.0.2"
  s.authors = ["Theodor Văraru"]
  s.email = ["theo@tvararu.ro"]
  s.homepage = "http://github.com/tvararu/ruby-tm"
  s.summary = "Command line turing machine interpreter."
  s.description = "A turing machine interpreter packaged as a command line tool."

  s.platform = Gem::Platform::RUBY
  s.has_rdoc = false

  s.executables << 'tm'
  s.license  = 'license.txt'

  s.files = %w(license.txt readme.md changelog.md)
end
