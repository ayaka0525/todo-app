# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"

# pin "application", preload: true
# pin "@hotwired/turbo-rails", to: "@hotwired--turbo-rails.js" # @8.0.5
# pin "@hotwired/turbo", to: "@hotwired--turbo.js" # @8.0.5
# pin "@rails/actioncable/src", to: "@rails--actioncable--src.js" # @7.2.100