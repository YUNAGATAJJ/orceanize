# Pin npm packages by running ./bin/importmap

pin 'application', preload: true
pin '@hotwired/turbo-rails', to: 'turbo.min.js', preload: true
pin '@hotwired/stimulus', to: 'https://ga.jspm.io/npm:@hotwired/stimulus@3.2.2/dist/stimulus.js'
pin '@hotwired/stimulus-loading', to: 'stimulus-loading.js', preload: true
pin 'canva', to: 'canva.js', preload: true
pin 'email_confirmation', to: 'email_confirmation.js', preload: true
# pin 'fontawesome', to: 'https://kit.fontawesome.com/38d256d108.js', preload: true
pin_all_from 'app/javascript/controllers', under: 'controllers'
pin 'stimulus-autocomplete', to: 'https://ga.jspm.io/npm:stimulus-autocomplete@3.1.0/src/autocomplete.js'
