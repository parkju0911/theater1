<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="//production-assets.codepen.io/assets/editor/live/console_runner-079c09a0e3b9ff743e39ee2d5637b9216b3545af0de366d4b9aad9dc87e26bfd.js"></script>
<script src="//production-assets.codepen.io/assets/editor/live/events_runner-73716630c22bbc8cff4bd0f07b135f00a0bdc5d14629260c3ec49e5606f98fdd.js"></script>
<script src="//production-assets.codepen.io/assets/editor/live/css_live_reload_init-2c0dc5167d60a5af3ee189d570b1835129687ea2a61bee3513dee3a50c115a77.js"></script>
<meta name="robots" content="noindex">
<link rel="shortcut icon" type="image/x-icon" href="//production-assets.codepen.io/assets/favicon/favicon-8ea04875e70c4b0bb41da869e81236e54394d63638a1ef12fa558a4a835f1164.ico">
<link rel="mask-icon" type="" href="//production-assets.codepen.io/assets/favicon/logo-pin-f2d2b6d2c61838f7e76325261b7195c27224080bc099486ddd6dccb469b8e8e6.svg" color="#111">
<link rel="canonical" href="https://codepen.io/jcoulterdesign/pen/pgwxJR">
<link rel="stylesheet prefetch" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<style type="text/css" class="cp-pen-styles">@import url(https://fonts.googleapis.com/css?family=Nunito:400,700);
body {
  padding: 0;
  margin: 0;
}
body .column {
  background: #F6F792;
  height: 100vh;
  float: left;
  width: 100%;
  position: relative;
}
body .two {
  background: #F6F792;
}
body .three {
  background: #EA2E49;
}
body .four {
  background: #333745;
}
body .search {
  position: absolute;
  left: 0;
  right: 0;
  margin: auto;
  top: 50%;
  -webkit-transform: translateY(-50%);
          transform: translateY(-50%);
  width: 100%;
  text-align: center;
  overflow: hidden;
}
body .search_barA {
  width: 280px;
  position: relative;
  margin: 0 auto;
}
body .search_barA input[type="text"] {
  width: 15px;
  background: transparent;
  -webkit-transition: border 0.3s 0s, width 0.2s 0.3s cubic-bezier(0.225, 0.01, 0.475, 1.01), text-indent 0.2s 0.3s;
  transition: border 0.3s 0s, width 0.2s 0.3s cubic-bezier(0.225, 0.01, 0.475, 1.01), text-indent 0.2s 0.3s;
  padding: 20px;
  border-color: #448996;
  text-indent: 30px;
  outline: none;
  border: 0px solid #448996;
  font-size: 12px;
  color: #A8A952;
  border-radius: 5px;
  font-family: 'Nunito', sans-serif;
}
body .search_barA ::-webkit-input-placeholder {
  /* Safari, Chrome and Opera */
  color: #448996;
  font-weight: 400;
  font-family: 'Nunito', sans-serif;
}
body .search_barA ::-moz-input-placeholder {
  /* Safari, Chrome and Opera */
  color: #448996;
  font-weight: 400;
  font-family: 'Nunito', sans-serif;
}
body .search_barA ::-o-input-placeholder {
  /* Safari, Chrome and Opera */
  color: #448996;
  font-weight: 400;
  font-family: 'Nunito', sans-serif;
}
body .search_barA input[type="checkbox"] {
  display: none;
}
body .search_barA input[type="checkbox"]:checked + label + input {
  width: 230px;
  border: 5px solid #448996;
  text-indent: 0px;
}
body .search_barA input[type="checkbox"]:checked + label i {
  right: 0px;
  -webkit-transform: translateY(-50%) translateX(50%) rotate(360deg) scale(0);
          transform: translateY(-50%) translateX(50%) rotate(360deg) scale(0);
  color: #448996;
}
body .search_barA input[type="checkbox"]:checked + label .last {
  left: 220px;
  -webkit-transform: translateY(-50%) rotate(360deg) scale(1);
          transform: translateY(-50%) rotate(360deg) scale(1);
}
body .search_barA input[type="checkbox"]:checked + label p {
  top: 50%;
  -webkit-transition: all .3s .45s;
  transition: all .3s .45s;
}
body .search_barA input[type="checkbox"]:not(checked) + label p {
  top: -50%;
  -webkit-transition: all .3s 0s;
  transition: all .3s 0s;
}
body .search_barA .last {
  -webkit-transform: translateY(-50%) rotate(0deg) scale(0);
  transform: translateY(-50%) rotate(0deg) scale(0);
}
body .search_barA i {
  position: absolute;
  font-size: 30px;
  top: 50%;
  -webkit-transform: translateY(-50%) translateX(50%) rotate(0deg) scale(1);
          transform: translateY(-50%) translateX(50%) rotate(0deg) scale(1);
  cursor: pointer;
  z-index: 2;
  margin: auto;
  border-radius: 4px;
  width: 56px;
  right: 50%;
  height: 54px;
  background: transparent;
  -webkit-transition: right .3s .3s, color .3s, -webkit-transform .3s .3s;
  transition: right .3s .3s, color .3s, -webkit-transform .3s .3s;
  transition: right .3s .3s, transform .3s .3s, color .3s;
  transition: right .3s .3s, transform .3s .3s, color .3s, -webkit-transform .3s .3s;
  line-height: 60px;
  color: #A8A952;
}
body .search_barA i:hover {
  color: #448996;
}
body .search_barA p {
  position: absolute;
  margin: 0;
  right: 52px;
  color: #448996;
  font-weight: 700;
  font-size: 30px;
  top: -50%;
  -webkit-transform: translateY(-50%) rotate(0deg) scale(1);
          transform: translateY(-50%) rotate(0deg) scale(1);
}
</style>
</head>
<body>

<div class="column">
  <div class="search">
    <div class="search_barA">
      <input id="searchOne" type="checkbox">
      <label for="searchOne">
        <i class="icon ion-android-search"></i>
        <i class="last icon ion-android-close"></i>
        <p>|</p>
      </label>
      <input placeholder="Search..." type="text">
    </div>
  </div>
</div>

</body>
</html>