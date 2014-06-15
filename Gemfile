source :rubygems

if ENV.key?('PUPPET_VERSION')
 puppetversion = "= #{ENV['PUPPET_VERSION']}"
else
 puppetversion = ['>= 2.7']
end

gem 'puppet-lint'
gem 'rspec-puppet'
gem 'puppet', puppetversion
