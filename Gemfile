source 'https://rubygems.org'
ruby '1.9.3'
gem 'rails', '4.0.2'
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 1.2'
gem 'activerecord-tableless'
gem 'bootstrap-sass'
gem 'figaro'
gem 'gibbon'
gem 'google_drive'
gem 'high_voltage'
gem 'simple_form'
gem 'devise'
gem 'omniauth'
gem 'omniauth-soundcloud', '~> 1.0.0'
gem "cancan"
gem "soundcloud"
gem 'open_uri_redirections'
gem "ruby-audioinfo"
gem "mixcloud"
gem 'omniauth-mixcloud','~> 1.0.0', :git => 'git://github.com/morganric/omniauth-mixcloud.git'#, :path => '~/sites/ruby/mygems/omniauth-mixcloud'

group :development, :test do
  gem  "debugger"
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller', :platforms=>[:mri_19, :mri_20, :rbx]
  gem 'guard-bundler'
  gem 'guard-rails'
  gem 'hub', :require=>nil
  gem 'quiet_assets'
  gem 'rails_layout'
  gem 'rb-fchange', :require=>false
  gem 'rb-fsevent', :require=>false
  gem 'rb-inotify', :require=>false
  gem 'sqlite3'
end
group :production do
  gem 'pg'
  gem 'rails_12factor'
  gem 'thin'
end
