// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")
require("trix")
require("@rails/actiontext")

// js.erbでjqueryを使う
require('jquery')
window.$ = jQuery;

// select2
import 'select2'
import 'select2/dist/css/select2.css'

// highcharts
import Highcharts from 'highcharts'
window.Highcharts = Highcharts;

require("../flash")
require("../flow")
require("../form")
require("../image")
require("../loading")
require("../menu")
require("../select")
require("../slide")
require("../template")
require("../toggle")

// require("../action_name")
// require("../mdn")
// require("../memo")

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

