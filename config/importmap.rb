# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
#下記のようにしたらいい byらんてくん
# pin "canva", to: "canva.js", preload: true
# pin "email_confirmation", to: "email_confirmation.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
