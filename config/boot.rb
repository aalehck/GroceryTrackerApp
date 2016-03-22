ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

require 'bundler/setup' # Set up gems listed in the Gemfile.

# Overrides the default binding address in development so that connections from
# the host machine of Vagrant VMs are accepted.
require 'rails/commands/server'
module DevelopmentDefaultHostOption
  def default_options
    system_defaults = super
    if Rails.env == 'development'
      system_defaults.merge!(Host: '0.0.0.0')
    end
  end
end
Rails::Server.send :prepend, DevelopmentDefaultHostOption
