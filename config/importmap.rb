# Pin npm packages by running ./bin/importmap
# config/importmap.rb
pin "application", preload: true
pin "@hotwired/turbo-rails", to: "@hotwired--turbo-rails.js" # @8.0.5
pin "@hotwired/turbo", to: "@hotwired--turbo.js" # @8.0.5
pin "@rails/actioncable/src", to: "@rails--actioncable--src.js" # @7.2.100
