'use strict';

require("html-loader!../index.html");
require('./Main.purs').main();
import "normalize.css";
import "./styles/advert/advert.styl"

if (module.hot) {
  module.hot.accept();
}

console.log('image from entrypoint.js')