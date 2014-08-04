# name: enable New Relic rpm
# about: New Relic support
# version: 0.1
# authors: Sam Saffron

ENV["NRCONFIG"] = File.expand_path('../newrelic.yml', __FILE__)
gem "newrelic_rpm", "3.6.7.152"

NewRelic::Control.instance.init_plugin :config => Rails.configuration

after_initialize do
  ForumsController.newrelic_ignore :only => [:status]
end