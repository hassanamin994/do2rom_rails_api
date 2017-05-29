apt-get update -y
apt-get install curl -y
\curl -L https://get.rvm.io | bash -s stable --ruby
rvm --default use ruby-2.3.1
apt-get install nodejs -y
gem update --system
gem install bundler #installing bundler
gem install nokogiri #installing nokogiri gem 
gem install rails --version=5.0.3 # install rails for the latest current stable version


