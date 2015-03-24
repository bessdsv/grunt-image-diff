<html>
<head>
  <title>photobox</title>
  <style type="text/css">


    * {
      box-sizing: border-box;
    }

    h2 {
      margin: 0;
      padding: 0;
      font-weight: 200;

      text-align: center;

      padding: 0.5em;
      color: #fff;
      background-color: #0F3340;
      box-shadow: inset 0 1px 2px #000;
    }

   /*a:before {
      content: attr(data-name);
      position: absolute;

      color: #BF4F2B;

      text-overflow: clip;
      white-space: nowrap;
      text-align: left;
      text-shadow: 0 1px 1px #000;

      width: 0;
      height: 105%;

      left: 0;
      top: 0;

      overflow: hidden;

      -moz-transition:    width 0.5s ease-in;
      -webkit-transition: width 0.5s ease-in;
      -o-transition:      width 0.5s ease-in;
      transition:         width 0.5s ease-in;
    }*/

    body {
      font-family: Helvetica;
      font-size: 14px;
      font-weight: 200;
    }

    main {
      width: 98%;
      margin: 0 auto;
      position: relative;

      background-color: #2E708A;
    }

    .row {
      width: 100%;

      padding: 1% 0;
      margin: 0 0 2% 0;
    }

    .col {
      display: inline-block;
      width: 30%;
      margin-left: 3.333%;

      position: relative;

      vertical-align: top;
    }

    .col img {
      width: 100%;

      box-shadow: 0 1px 1px #333;
    }

    .colContainer {
      position: relative;
      width: 100%;
      margin-left: -1.666%;
      clear: both;
    }

    .name {
      font-size: 2em;

      padding: 0.5em 0.5em 0.5em 1em;
      margin: 1em 0 0 -0.0625em;

      background-color: #F4882D;
      box-shadow: 0 1px 1px #333;
      text-align: center;
      color: #3da1fe;
      float: left;

      color: #fff;
    }

    /**
 * CSS Modal
 * http://drublic.github.com/css-modal
 *
 * @author Hans Christian Reinl - @drublic
 */
    /**
     * CSS Modal Configuration
     * http://drublic.github.com/css-modal
     *
     * @author Hans Christian Reinl - @drublic
     */
    html {
      overflow-y: scroll;
      -webkit-overflow-scrolling: touch; }

    .has-overlay {
      overflow: hidden; }
    .has-overlay > body {
      height: 100%;
      overflow: hidden; }

    .modal--fade, .modal--show {
      -webkit-transform: translate(0, 100%);
      -moz-transform: translate(0, 100%);
      -o-transform: translate(0, 100%);
      -ms-transform: translate(0, 100%);
      transform: translate(0, 100%);
      -webkit-transform: translate3d(0, 100%, 0);
      transform: translate3d(0, 100%, 0);
      position: fixed;
      top: 0;
      left: 0;
      right: 0;
      bottom: 0;
      z-index: 999;
      width: 0;
      height: 0;
      overflow: hidden;
      opacity: 0;
      display: none\9; }
    .modal--fade:target, .modal--show:target, .is-active.modal--fade, .is-active.modal--show {
      -webkit-transform: translate(0, 0);
      -moz-transform: translate(0, 0);
      -o-transform: translate(0, 0);
      -ms-transform: translate(0, 0);
      transform: translate(0, 0);
      width: auto;
      height: auto;
      opacity: 1; }
    .is-active.modal--fade, .is-active.modal--show {
      display: block\9;
      height: 100% \9;
      width: 100% \9; }
    .modal--fade:target, .modal--show:target, .is-active.modal--fade, .is-active.modal--show {
      display: block\9; }
    .modal--fade .modal-inner, .modal--show .modal-inner {
      position: absolute;
      top: 60px;
      left: 50%;
      z-index: 20;
      margin-left: -325px;
      width: 650px;
      overflow-x: hidden;
      -webkit-overflow-scrolling: touch; }
    .modal--fade .modal-inner > img, .modal--show .modal-inner > img,
    .modal--fade .modal-inner > video,
    .modal--show .modal-inner > video,
    .modal--fade .modal-inner > iframe,
    .modal--show .modal-inner > iframe {
      width: 100%;
      height: auto;
      min-height: 300px; }
    .modal--fade .modal-inner > img, .modal--show .modal-inner > img {
      width: auto;
      max-width: 100%; }
    .modal--fade .modal-inner iframe, .modal--show .modal-inner iframe {
      display: block;
      width: 100%;
      border: 0; }
    .modal--fade .modal-content, .modal--show .modal-content {
      position: relative;
      max-height: 400px;
      max-height: 60vh;
      overflow-x: hidden;
      overflow-y: auto;
      -webkit-overflow-scrolling: touch; }
    .modal--fade .modal-content > *, .modal--show .modal-content > * {
      max-width: 100%; }
    .modal--fade footer, .modal--show footer {
      border-top: 1px solid white;
      padding: 0 1.2em 18px;
      background: #f0f0f0;
      border-radius: 2px; }
    .modal--fade .modal-close, .modal--show .modal-close {
      display: block;
      height: 1px;
      clip: rect(0 0 0 0);
      margin: -1px;
      overflow: hidden; }
    .modal--fade .modal-close:focus:after, .modal--show .modal-close:focus:after {
      outline: 1px dotted;
      outline: -webkit-focus-ring-color auto 5px; }
    .modal--fade .modal-close:before, .modal--show .modal-close:before {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      right: 0;
      bottom: 0;
      z-index: 10; }
    .modal--fade .modal-close:after, .modal--show .modal-close:after {
      content: '\00d7';
      position: absolute;
      top: 35px;
      right: 50%;
      z-index: 20;
      margin-right: -325px; }
    @media screen and (max-width: 690px) {
      .modal--fade .modal-inner, .modal--show .modal-inner {
        width: auto;
        left: 20px;
        right: 20px;
        margin-left: 0; }
      .modal--fade .modal-close:after, .modal--show .modal-close:after {
        margin-right: 0 !important;
        right: 20px; } }
    @media screen and (max-width: 30em) {
      .modal--fade, .modal--show {
        -webkit-transform: translate(0, 400px);
        -webkit-transform: translate3d(0, 100%, 0);
        transform: translate3d(0, 100%, 0);
        -webkit-transition: opacity 1ms .25s;
        -moz-transition: opacity 1ms .25s;
        -o-transition: opacity 1ms .25s;
        -ms-transition: opacity 1ms .25s;
        transition: opacity 1ms .25s;
        display: block;
        right: auto;
        bottom: auto; }
      .modal--fade:target, .modal--show:target, .is-active.modal--fade, .is-active.modal--show {
        width: 100%;
        height: 100%; }
      .modal--fade:target .modal-close, .modal--show:target .modal-close, .is-active.modal--fade .modal-close, .is-active.modal--show .modal-close {
        display: block; }
      .modal--fade .modal-inner, .modal--show .modal-inner {
        -webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;
        box-sizing: border-box;
        top: 0;
        left: 0;
        right: 0;
        height: 100%;
        overflow: auto; }
      .modal--fade .modal-content, .modal--show .modal-content {
        max-height: none;
        -ms-word-break: break-all;
        word-break: break-all;
        word-break: break-word;
        -webkit-hyphens: auto;
        -moz-hyphens: auto;
        hyphens: auto; }
      .modal--fade .modal-close, .modal--show .modal-close {
        display: none;
        right: auto; }
      .modal--fade .modal-close:before, .modal--show .modal-close:before {
        content: '';
        position: fixed;
        top: 0;
        left: 0;
        right: 0;
        z-index: 20; }
      .modal--fade .modal-close:after, .modal--show .modal-close:after {
        top: 5px !important;
        right: 5px;
        left: auto;
        margin-left: 0; } }
    @media screen and (max-height: 46em) and (min-width: 30em) {
      .modal--fade .modal-content, .modal--show .modal-content {
        max-height: 340px;
        max-height: 50vh; } }
    @media screen and (max-height: 36em) and (min-width: 30em) {
      .modal--fade .modal-content, .modal--show .modal-content {
        max-height: 265px;
        max-height: 40vh; } }
    .is-stacked.modal--fade, .is-stacked.modal--show {
      -webkit-transform: translate(0, 0) scale(1, 1);
      -moz-transform: translate(0, 0) scale(1, 1);
      -o-transform: translate(0, 0) scale(1, 1);
      -ms-transform: translate(0, 0) scale(1, 1);
      transform: translate(0, 0) scale(1, 1);
      opacity: 1; }
    .is-stacked.modal--fade .modal-inner, .is-stacked.modal--show .modal-inner {
      -webkit-animation: scaleDown .7s ease both;
      -moz-animation: scaleDown .7s ease both;
      animation: scaleDown .7s ease both; }
    .is-stacked.modal--fade .modal-close, .is-stacked.modal--show .modal-close {
      opacity: 0; }
    @media screen and (max-width: 30em) {
      .is-stacked.modal--fade, .is-stacked.modal--show {
        -webkit-animation: scaleDown .7s ease both;
        -moz-animation: scaleDown .7s ease both;
        animation: scaleDown .7s ease both; }
      .is-stacked.modal--fade .modal-inner, .is-stacked.modal--show .modal-inner {
        -webkit-animation: none;
        -moz-animation: none;
        animation: none; }
      .is-stacked.modal--fade .modal-close, .is-stacked.modal--show .modal-close {
        opacity: 1; } }

    /**
     * All animations for CSS Modal
     *
     * Available:
     * - %modal--transition-fade (fade)
     * - %modal--transition-zoomIn (zooms in)
     * - %modal--transition-plainScreen (hides background)
     *
     * Usage:
     *
     * .selector {
     * 		@extend %modal--transition-fade;
     * }
     *
     */
    @media screen and (min-width: 30em) {
      .modal--fade {
        transition: opacity 0.4s; } }

    /**
     * CSS Modal Themes
     * http://drublic.github.com/css-modal
     *
     * @author Hans Christian Reinl - @drublic
     */
    /*
     * Global Theme Styles
     */
    .modal--fade, .modal--show {
      color: #222;
      line-height: 1.3; }
    .modal--fade .modal-inner, .modal--show .modal-inner {
      border-radius: 2px;
      background: #fff;
      -webkit-box-shadow: 0 0 30px rgba(0, 0, 0, 0.6);
      box-shadow: 0 0 30px rgba(0, 0, 0, 0.6);
      max-width: 100%;
      -webkit-transition: max-width 0.25s linear, margin-left 0.125s linear;
      transition: max-width 0.25s linear, margin-left 0.125s linear; }
    .modal--fade header, .modal--show header {
      border-bottom: 1px solid #ddd;
      padding: 0 1.2em; }
    .modal--fade header > h2, .modal--show header > h2 {
      margin: 0.5em 0; }
    .modal--fade .modal-content, .modal--show .modal-content {
      border-bottom: 1px solid #ddd;
      padding: 15px 1.2em; }
    .modal--fade footer, .modal--show footer {
      border-top: 1px solid white;
      padding: 0 1.2em 18px;
      background: #f0f0f0;
      border-radius: 2px; }
    .modal--fade .modal-close, .modal--show .modal-close {
      text-indent: -100px; }
    .modal--fade .modal-close:before, .modal--show .modal-close:before {
      background: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAQAAAC1+jfqAAAAEUlEQVQoz2NgeEYAjioYSQoAzOTmAXhPhyoAAAAASUVORK5CYII="); }
    .modal--fade .modal-close:after, .modal--show .modal-close:after {
      content: '\00d7';
      background: #fff;
      border-radius: 2px;
      padding: 2px 8px;
      font-size: 1.2em;
      text-decoration: none;
      text-indent: 0; }
    @media screen and (max-width: 30em) {
      .modal--fade .modal-close:before, .modal--show .modal-close:before {
        background: #27aae2;
        height: 3em;
        -webkit-box-shadow: 0 0 5px rgba(0, 0, 0, 0.6);
        box-shadow: 0 0 5px rgba(0, 0, 0, 0.6); }
      .modal--fade .modal-inner, .modal--show .modal-inner {
        padding-top: 3em;
        -webkit-box-shadow: none;
        box-shadow: none; }
      .modal--fade .modal-close, .modal--show .modal-close {
        text-decoration: none; }
      .modal--fade .modal-close:after, .modal--show .modal-close:after {
        content: attr(data-close);
        font-size: 1em;
        padding: 0.5em 1em; } }

    /*
     * Plain Screen Theme Styles
     */
    /**
     * Apply the desired modal behavior to your container selector
     */

  </style>
</head>
<body>
  <main class="">
      <% _.each( templateData, function( image ) {%>
        <div class="row">
          <div class="name"><%= image.fullName %> (<%= image.browser %>)</div>
          <div class="colContainer">
            <div class="col">
              <h2>Предыдущий запуск</h2>
    <a href="#<%= image.test %>"><img src="" data-src="<%= image.test %>"></a>
    <section class="modal--show" id="<%= image.test %>" tabindex="-1" data-cssmodal-resize
    role="dialog" aria-labelledby="modal-label" aria-hidden="true">
    <div class="modal-inner">
    <div class="modal-content">
    <img src="" data-src="<%= image.test %>">
    </div>
    </div>

    <a href="#!" class="modal-close" title="Закрыть" data-close="Close"
    data-dismiss="modal">×</a>
    </section>
            </div><div class="col">
              <h2>Разница</h2>
    <a href="#<%= image.diff %>"><img src="" data-src="<%= image.diff %>"></a>
    <section class="modal--show" id="<%= image.diff %>" tabindex="-1" data-cssmodal-resize
    role="dialog" aria-labelledby="modal-label" aria-hidden="true">
    <div class="modal-inner">
    <div class="modal-content">
    <img src="" data-src="<%= image.diff %>">
    </div>
    </div>

    <a href="#!" class="modal-close" title="Закрыть" data-close="Close"
    data-dismiss="modal">×</a>
    </section>
            </div><div class="col">
              <h2>Новый запуск</h2>
    <a href="#<%= image.orig %>"><img src="" data-src="<%= image.orig %>"></a>
    <section class="modal--show" id="<%= image.orig %>" tabindex="-1" data-cssmodal-resize
    role="dialog" aria-labelledby="modal-label" aria-hidden="true">
    <div class="modal-inner">
    <div class="modal-content">
    <img src="" data-src="<%= image.orig %>">
    </div>
    </div>

    <a href="#!" class="modal-close" title="Закрыть" data-close="Close"
    data-dismiss="modal">×</a>
    </section>
            </div>
          </div>
        </div>
      <% } );%>
  </main>

  <script type="text/javascript">
  (function(){
    'use strict';
    var imagesList      = document.querySelectorAll( 'img' ),
        images          = Array.prototype.slice.call( imagesList, 0 );

    images.forEach( function( image ) {
      image.src = image.dataset.src;
    } );


  })();
  </script>

</body>
</html>
