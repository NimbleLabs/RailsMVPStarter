// Entry point for the build script in your package.json

import Rails from "@rails/ujs"

window.Rails = Rails;
Rails.start()

import * as bootstrap from "./bootstrap"
