 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://cdn.ckeditor.com/4.7.3/standard/ckeditor.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="./resources/SE2/js/HuskyEZCreator.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="./resources/css/common/header.css" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link href="./resources/css/drama/dramaList.css" rel="stylesheet">
<link href="styles/ihover.css" rel="stylesheet">
<link href="./resources/css/common/ihover.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>

<link href='https://fonts.googleapis.com/css?family=Montserrat:700' rel='stylesheet' type='text/css'>
   <title>Home</title>

<style type="text/css">
header{
    background-image: url(./resources/images/home/headerImg.jpg);
    height: 980px;
    width: 100%;    
    background-size: cover;
    background-position-y: -189px;
}
nav li a {
    text-shadow: #fffffb66 0px 2px, #fffffb6b 2px 0px, #fffffb69 -2px 0px, #fffffb69 0px -2px, #fffffb57 -1.4px -1.4px, #fffffb47 1.4px 1.4px, #fffffb54 1.4px -1.4px, #fffffb40 -1.4px 1.4px;
}
.search_bar{
margin-right: 25px;
    width: 214px;
    }
.member_wrap a{
}
.push{
	height: 0px;
}
.main_cs_divide {
    float: left;
    width: 33%;
    height: 77px;
    border-right: 1px solid #d6d6d6;
}
a:link {
    text-decoration: none;
}
img {
    border: none;
    margin: 0;
}
a {
    color: #313131;
}
.main_cs_divide {
    float: left;
    width: 33%;
    height: 77px;
    border-right: 1px solid #d6d6d6;
}
table {
    border-collapse: collapse;
}
td, select {
    font-size: 13px;
    font-weight: 300;
}
.ellip {
    word-break: break-all;
    text-overflow: ellipsis;
    overflow: hidden;
    white-space: nowrap;
}
.main_notice_txt {
    width: 250px;
    font-size: 13px;
    font-weight: 300;
    text-align: left;
    line-height: 20px;
}
#slidebox {
		position:relative;
		/* width: 690px;
    height: 518px; */
       width: 363px;
    height: 226px;
		overflow:hidden;
		white-space:nowrap;
		    MARGIN: 0 AUTO;
	}
	#slidebox ul#slider {
		list-style:none;
		margin:0;
		padding:0;
	}
	#slidebox ul li {
		position:absolute;
		/* MARGIN-TOP: 128PX; */
		margin-top: 45px;
	}
	#slidebox ul li img {
		/* width: 689PX;
    height: 390PX; */
    width: 366PX;
    height: 180px;
 }
 
 
 $green: #2ecc71;
$red: #e74c3c;
$blue: #3498db;
$yellow: #f1c40f;
$purple: #8e44ad;
$turquoise: #1abc9c;

// Reset and Layout Styles
/* html, body {
  margin: 0;
  padding: 0;
  width: 100%;
  height: 100%;
  background: #2c3e50;
  font-family: 'Montserrat', sans-serif;
  font-size: 16px;
}
body {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-around;
  align-items: center;
  align-content: center;
}

h1 {
  color: $yellow;
  font-size: 4rem;
  text-transform: uppercase;
  display: block;
  width: 100%;
  text-align: center; */
  /* 
  @media screen and (max-width: 600px) {
    font-size: 3rem;
  }

p {
  color: $yellow;
  font-size: 1.2rem;
  // text-transform: uppercase;
  width: 100%;
  padding: 20px;
  text-align: center;
}


// Basic Button Style
.btn {
  box-sizing: border-box;
  appearance: none;
  background-color: transparent;
  border: 2px solid $red;
  border-radius: 0.6em;
  color: $red;
  cursor: pointer;
  display: flex;
  align-self: center;
  font-size: 1rem;
  font-weight: 400;
  line-height: 1;
  margin: 20px;
  padding: 1.2em 2.8em;
  text-decoration: none;
  text-align: center;
  text-transform: uppercase;
  font-family: 'Montserrat', sans-serif;
  font-weight: 700;
}
 .btn:hover,
  .btn:focus {
    color: #fff;
    outline: 0;
}
 
 .fourth {
  // background: $yellow;
  border-color: $yellow;
  color: #fff;
  transition: background 300ms ease-in-out;
  background-image: linear-gradient(45deg,$yellow 50%, transparent 50%);
   background-position: 100%;
   background-size: 400%;
  }
 .fourth:hover {
    background-position: 0;
  }
  
  
  @import url(https://fonts.googleapis.com/css?family=Open+Sans:400|Raleway:300);

$btn-width: 250px !default;
$btn-height: 80px !default;
$btn-full: $btn-height+$btn-width !default;
$btn-half: $btn-full/2 !default;
$bg-color: #eeeeee !default;

html {
  padding-top: 50px;
  font-family: 'Open Sans', Helvetica, arial, sans-serif;
  text-align: center;
  background-color: $bg-color;
}
  *,
  *:before,
  *:after {
    box-sizing: border-box;
    transition: 0.5s ease-in-out;
  }

  i,em,
  b,strong,
  span {
    transition: none;
  }

*:before,
*:after {
  z-index: -1;
}

h1,
h4 {
  font-family: 'Raleway', 'Open Sans', sans-serif;
  margin: 0;
  line-height: 1;
}

a {
  text-decoration: none;
  line-height: $btn-height;
  color: black;
}

.centerer {
  width: 100%;
  max-width: 600px;
  margin: 0 auto;
  padding: 0 1rem
}

@media (min-width: 600px) {
  .wrap {
    width: 50%;
    float: left;
  }
}

[class^="btn-"] {
  position: relative;
  display: block;
  overflow: hidden;
  @include size(100%, $btn-height);
  max-width: $btn-width;
  margin: 1rem auto;
  text-transform: uppercase;
  border: 1px solid currentColor;
}

.btn-0 {
  $btn-color: random-color($max:200);
  $btn-color-dark: shade($btn-color, 40%);
  color: tint($btn-color);
}
.btn-0:before {
    content: '';
    @include absolute(0,0,0,0);
    background-color: $btn-color-dark;
    transform: translateX(-100%);
  }

.btn-0:hover {
    color: tint($btn-color, 75%);
}
 .btn-0:before {
      transform: translateX(0);
 }
  
  
  .boton {
        width: 200px;
        height: 50px;
        margin: 200px auto;
        display: block;
        position: relative;
    }
    .botontext {
        position: absolute;
        height: 100%;
        width: 100%;
        z-index: 1;
        text-align: center;
        line-height: 50px;
        font-family: 'Montserrat', sans-serif;
        font-size: 12px;
        text-transform: uppercase;
    }
    
    .twist {
        display: block;
        height: 100%;
        width: 25%;
        position: relative;
        float: left;
        margin-left: -4px;
    }
    
    .twist:before {
        content: "";
        width: 100%;
        height: 100%;
        background: #fed5a9;
        bottom: 100%;
        position: absolute;
        transform-origin: center bottom 0px; 
        transform: matrix3d(1, 0, 0, 0, 
                            0, 0, -1, -0.003, 
                            0, 1, 0, 0, 
                            0, 0, 0, 1);
        
-webkit-transition: all 500ms cubic-bezier(0.970, 0.000, 0.395, 0.995); 
   -moz-transition: all 500ms cubic-bezier(0.970, 0.000, 0.395, 0.995); 
     -o-transition: all 500ms cubic-bezier(0.970, 0.000, 0.395, 0.995); 
        transition: all 500ms cubic-bezier(0.970, 0.000, 0.395, 0.995); 
    }
    
    .twist:after {
        content: "";
        position: absolute;
        width: 100%;
        top: 100%;
        height: 100%;
        background: #9f7f5e;
        transform-origin: center top 0px;
        transform: matrix3d(1, 0, 0, 0, 
                            0, 1, 0, 0, 
                            0, 0, 1, -0.003, 
                            0, -50, 0, 1);
        
-webkit-transition: all 500ms cubic-bezier(0.970, 0.000, 0.395, 0.995); 
   -moz-transition: all 500ms cubic-bezier(0.970, 0.000, 0.395, 0.995); 
     -o-transition: all 500ms cubic-bezier(0.970, 0.000, 0.395, 0.995); 
        transition: all 500ms cubic-bezier(0.970, 0.000, 0.395, 0.995);
    }
    
    .boton:hover .twist:before {
        background: #fff;
        transform: matrix3d(1, 0, 0, 0, 
                            0, 1, 0, 0, 
                            0, 0, 1, 0.003, 
                            0, 50, 0, 1);
    }
    
    .boton:hover .twist:after {
        background: #dedae1;
        transform: matrix3d(1, 0, 0, 0, 
                            0, 0, -1, 0.003, 
                            0, 1, 0, 0, 
                            0, 0, 0, 1);
    }

    .boton .twist:nth-of-type(1) {
        margin-left: 0;
    }
    
    .boton .twist:nth-of-type(1):before,
    .boton .twist:nth-of-type(1):after {
        transition-delay: 0s;
    }
    
    .boton .twist:nth-of-type(2):before,
    .boton .twist:nth-of-type(2):after {
        transition-delay: 0.1s;
    }
    
    .boton .twist:nth-of-type(3):before,
    .boton .twist:nth-of-type(3):after {
        transition-delay: 0.2s;
    }
    
    .boton .twist:nth-of-type(4):before,
    .boton .twist:nth-of-type(4):after {
        transition-delay: 0.3s;
    }
    
    .boton .botontext:nth-of-type(1) {
        color: #3d3b40;
        bottom: 100%;
        transform-origin: center bottom 0px; 
        transform: matrix3d(1, 0, 0, 0, 
                            0, 0, -1, -0.003, 
                            0, 1, 0, 0, 
                            0, 0, 0, 1);
        
-webkit-transition: all 500ms cubic-bezier(0.970, 0.000, 0.395, 0.995); 
   -moz-transition: all 500ms cubic-bezier(0.970, 0.000, 0.395, 0.995); 
     -o-transition: all 500ms cubic-bezier(0.970, 0.000, 0.395, 0.995); 
        transition: all 500ms cubic-bezier(0.970, 0.000, 0.395, 0.995);
    }
    
    .boton:hover .botontext:nth-of-type(1) {
        transform: matrix3d(1, 0, 0, 0, 
                            0, 1, 0, 0, 
                            0, 0, 1, 0.003, 
                            0, 50, 0, 1);
    }
    
    .boton .botontext:nth-of-type(2) {
        color: #fff;
        top: 100%;
        transform-origin: center top 0px;
        transform: matrix3d(1, 0, 0, 0, 
                            0, 1, 0, 0, 
                            0, 0, 1, -0.003, 
                            0, -50, 0, 1);
        
-webkit-transition: all 500ms cubic-bezier(0.970, 0.000, 0.395, 0.995); 
   -moz-transition: all 500ms cubic-bezier(0.970, 0.000, 0.395, 0.995); 
     -o-transition: all 500ms cubic-bezier(0.970, 0.000, 0.395, 0.995); 
        transition: all 500ms cubic-bezier(0.970, 0.000, 0.395, 0.995); 
    }
    
    .boton:hover .botontext:nth-of-type(2) {
        transform: matrix3d(1, 0, 0, 0, 
                            0, 0, -1, 0.003, 
                            0, 1, 0, 0, 
                            0, 0, 0, 1);
    }
   */
</style>
</head>
<script type="text/javascript">
   var result = '${result}';
   if(result != ""){
      alert('${result}');
   }
</script>

<script type="text/javascript">
$(".hover").mouseleave(
		  function () {
		    $(this).removeClass("hover");
		  }
		);



function popupOpen(){

	var popUrl = "http://192.168.20.48/project/drama/chatform";	//팝업창에 출력될 페이지 URL

	var popOption = "width=360, height=440, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)

		window.open(popUrl,"",popOption);

	}


	
	
	$(document).ready(function() {
		  var count = 0;
		  var blocks = $(".main-section");

		  var testEffect = setInterval(function() {
		    $(blocks[count - 1]).removeClass("hover");
		    $(blocks[count]).addClass("hover");
		    count++;
		    if (count > 4) clearInterval(testEffect);
		  }, 800);
		});

</script>






<body>
<c:import url="./temp/header.jsp"></c:import>
<c:if test="${member.id eq null}">
<!-- <a href="#" class="boton">
Fantastic    
</a>
 -->
 <!-- <div class="wrap">
    <a class="btn-0" href="#">Swipe</a>
    </div> -->
<p style=" margin: 0 auto;
    width: 250px;
    margin-top: -204px;"><button class="fourth"  style="background-color: #ffc910;
    width: 250px;
    height: 71px;
    margin: 0 auto;
    border-radius: 10px;
    color: white;">JOIN US</button>
</p>
</c:if>

	<p style="    width: 250px;
    height: auto;
    margin: 0 auto;
    padding-top: 300px;"><img style="    width: 250px;" alt="" src="./resources/images/home/homeDrama.png"></p>

				<div class="mainDramaList" style="margin: 0 auto;    width: 1000px;   overflow: overlay;    padding: 50px;">
				<c:forEach begin="0" end="5" var = "j">
					<a href="./drama/dramaview?drama_num=${list[j].drama_num}">
					<div class="col-md-4 unpa-ad-responsive-parent"  style="    PADDING-LEFT: 50PX; width: 300px; height: 290px;MARGIN-TOP: 50PX;">
						<!-- <div class="unpa-card unpa-card-box-shadow unpa-review" style="background-color: snow;"> -->
							<div class="main-section"style="width: 260PX;">
								<%-- <a class="user-info-link" href="">
									<div class="user-info" style="display: inline-block; ">
										<div class="unpa-feed-user-info-box">
											<div class="unpa-user-block">
												<div class="user-labels" style="margin-top: 5px;">
													<span class="skin-type false ">${list[j].place}</span>
												</div>
											</div>
										</div>
									</div>
									<div class="time">${list[j].file_num}</div>
								</a> --%>
								<div class="unpa-feed-card-hover-actions">
									<span class="unpa-share-this-button"><i
										class="unpacon-share"></i></span>

								</div>

					
					<%-- 	<a href="./drama/dramaview?drama_num=${list[j].drama_num}"> --%>
							<figure class="snip1566">	
								<div class="main-image"
									style="background-position: center; width: 220px;height: 220px; border-radius: 100%; background-image: url('./resources/upload/${file[j].file_name}');">									
								</div>
								 <figcaption><i class="ion-android-add"></i></figcaption>
						
								<div class="review-contents">
									<div class="product-info" style="min-height: 60px;    text-align: center; padding-top: 10px;">
										<!-- <div class="left">
										
											<div class="product-image"
												style="background-image: url(./resources/images/drama_1.jpg')"></div>
										</div> -->


										<div class="right">
											<div class="brand-name-and-rating">
												<div class="brand-name" style="color: black;font-size: 12px;font-family: 'Nanum Gothic', sans-serif;">
												<%-- 	<a href="./drama/dramaview?drama_num=${list[j].drama_num}"> --%>${list[j].title}<br><p style="color: #a2a2a2;">${list[j].place}</p>
												</div>
											</div>
										</div>
									</div>
								</div>
							</figure>
						</div>
						</div>
						</a>
						</c:forEach>
						</div>
					<%-- </div>	
					</a>
				</c:forEach>
				</div>
					 --%>
					 
					 
					 <div style="height: 140px;"></div>
					 <p ><img style="width: 12%;margin-bottom: -13px;" alt="" src="./resources/images/home/homeEvent.png"></p>
<!-- SLIDEBOX -->
	<div class="w3-content w3-display-container" style="max-width: 100%; background-image: url(./resources/images/home/film.png);width: 100%;  height: 270px;MARGIN: 0 AUTO; background-repeat: round;">
	<!-- style="max-width: 1000px;  background-image: url(./resources/images/home/MAINBG.png);    width: 100%;    height: 650px;    MARGIN: 0 AUTO;" -->
			<div id="slidebox"  style="    float: left;  margin-left: 9px;">
			<ul id="slider">
				<li>
					<a href="./event/eventView.event?num=3"><img class="mySlides" src="./resources/images/home/main1.jpg"></a>
				</li>
				<!-- <li>
					<a href="./event/eventView.event?num=3"><img class="mySlides" src="./resources/images/home/main2.jpg"></a>
				</li>
				<li>
					<a href="./event/eventView.event?num=4"><img class="mySlides" src="./resources/images/home/main3.jpg"></a>
				</li>
				<li>
					<a href="./event/eventView.event?num=2"><img class="mySlides" src="./resources/images/home/main4.jpg"></a>
				</li>
				<li>
					<a href="./event/eventView.event?num=3"><img class="mySlides" src="./resources/images/home/main5.jpg"></a>
				</li> -->
			</ul>
		</div>
		
			<div id="slidebox" style="float: left;margin-left: 17px;">
			<ul id="slider">
				<li>
					<a href="./event/eventView.event?num=12"><img class="mySlides" src="./resources/images/home/main5.jpg"></a>
				</li>
				<!-- <li>
					<a href="./event/eventView.event?num=3"><img class="mySlides" src="./resources/images/home/main1.jpg"></a>
				</li>
				<li>
					<a href="./event/eventView.event?num=3"><img class="mySlides" src="./resources/images/home/main2.jpg"></a>
				</li>
				<li>
					<a href="./event/eventView.event?num=4"><img class="mySlides" src="./resources/images/home/main3.jpg"></a>
				</li>
				<li>
					<a href="./event/eventView.event?num=2"><img class="mySlides" src="./resources/images/home/main4.jpg"></a>
				</li> -->
			</ul>
		</div>
		
			<div id="slidebox" style="float: left;margin-left: 18px;">
			<ul id="slider">
				<li>
					<a href="./event/eventView.event?num=2"><img class="mySlides" src="./resources/images/home/main4.jpg"></a>
				</li>
				<!-- <li>
					<a href="./event/eventView.event?num=3"><img class="mySlides" src="./resources/images/home/main5.jpg"></a>
				</li>
				<li>
					<a href="./event/eventView.event?num=3"><img class="mySlides" src="./resources/images/home/main1.jpg"></a>
				</li>
				<li>
					<a href="./event/eventView.event?num=3"><img class="mySlides" src="./resources/images/home/main2.jpg"></a>
				</li>
				<li>
					<a href="./event/eventView.event?num=4"><img class="mySlides" src="./resources/images/home/main3.jpg"></a>
				</li> -->
			</ul>
		</div>
		
			<div id="slidebox" style="float: left;margin-left: 17px;">
			<ul id="slider">
				<li>
					<a href="./event/eventView.event?num=4"><img class="mySlides" src="./resources/images/home/main3.jpg"></a>
				</li>
				<!-- <li>
					<a href="./event/eventView.event?num=2"><img class="mySlides" src="./resources/images/home/main4.jpg"></a>
				</li>
				<li>
					<a href="./event/eventView.event?num=3"><img class="mySlides" src="./resources/images/home/main5.jpg"></a>
				</li>
				<li>
					<a href="./event/eventView.event?num=3"><img class="mySlides" src="./resources/images/home/main1.jpg"></a>
				</li>
				<li>
					<a href="./event/eventView.event?num=3"><img class="mySlides" src="./resources/images/home/main2.jpg"></a>
				</li> -->
			</ul>
		</div>
		
			<div id="slidebox" style="    float: right;margin-right: 8px;">
			<ul id="slider">
				<li>
					<a href="./event/eventView.event?num=11"><img class="mySlides" src="./resources/images/home/main2.jpg"></a>
				</li>
				<!-- <li>
					<a href="./event/eventView.event?num=4"><img class="mySlides" src="./resources/images/home/main3.jpg"></a>
				</li>
				<li>
					<a href="./event/eventView.event?num=2"><img class="mySlides" src="./resources/images/home/main4.jpg"></a>
				</li>
				<li>
					<a href="./event/eventView.event?num=3"><img class="mySlides" src="./resources/images/home/main5.jpg"></a>
				</li>
				<li>
					<a href="./event/eventView.event?num=3"><img class="mySlides" src="./resources/images/home/main1.jpg"></a>
				</li> -->
			</ul>
		</div>
	</div>
<!-- 
<script type='text/javascript'>
	var x = 366;
	var slider = document.getElementById("slider");
	var slideArray = slider.getElementsByTagName("li");
	var slideMax = slideArray.length - 1;
	var curSlideNo = 0;

	for (i = 0; i <= slideMax; i++) {
		if (i == curSlideNo){
			var slideMax = slideArray.length - 1;
		}
		else{
			slideArray[i].style.right = -x + "px";
		}
	}

	slider.addEventListener('click', function() {
		changeSlide();
	}, false);

	var aniStart = false;
	var next = 1;
	var changeSlide = function() {
		if (aniStart === true)
			return;
		next = curSlideNo + 1;
		if (next > slideMax)
			next = 0;
		aniStart = true;
		sliding();
	}

	function sliding() {
		var curX = parseInt(slideArray[curSlideNo].style.right, 10);
		var nextX = parseInt(slideArray[next].style.right, 10);
		var newCurX = curX + 10;
		var newNextX = nextX + 10;
		if (newCurX >= x) {
			slideArray[curSlideNo].style.right = -x + "px";
			slideArray[next].style.right = 0;
			curSlideNo = curSlideNo + 1;
			if (curSlideNo > slideMax)
				curSlideNo = 0;
			aniStart = false;
			return;
		}
		slideArray[curSlideNo].style.right = newCurX + "px";
		slideArray[next].style.right = newNextX + "px";
		setTimeout(function() {
			sliding();
		}, 20);
	}
	setInterval(changeSlide, 6000);
</script> -->
					 
					 
					 
					 
		
<!-- HOME FOOTER -->
	<div style="padding: 50px 0 60px 0; margin-top: 30px; background: #eee;">
		<div class="main_wrap" style="width: 960px; margin: 0 auto;">
		
		

			<div class="main_cs_divide" style="text-align: center;" alt="출석체크">
			
			<c:if test="${member.id eq null}">
				<a href="#"onclick="if(!alert('출석체크를 하려면 로그인이 필요합니다.')){return false;}">
				<img src="./resources/images/home/btn_point.png"
					style="padding: 8px 10px;">
			</c:if>
			<c:if test="${member.id ne null}">
				<a href="./point/pointCheck"> <img
					src="./resources/images/home/btn_point.png"
					style="padding: 8px 10px;">
			</c:if>
				</a> <a href="./member/faq"> <img
					src="./resources/images/home/btn_faq.png"
					style="padding: 8px 10px;">
				</a> <a href="javascript:popupOpen();"> <img
					src="./resources/images/home/btn_chatting.png"
					style="padding: 8px 10px;">
				</a>
			</div>

			<div class="main_cs_divide">
				<div style="padding: 5px 20px; text-align: left;">
					<img src="./resources/images/home/title_notice.png"
						style="padding: 0 0 11px 12px;" alt="공지사항"> <a
						href="./notice/noticeList"> <img
						src="./resources/images/home/btn_more.png"
						style="margin: 0 0 11px 10px;">
					</a>
					<table width="100%" cellpadding="0" cellspacing="0" border="0">
						<c:forEach begin="0" end="1" var = "i">
							<tbody>
								<tr>
								<td valign="top" align="center">
									<div class="main_notice_txt ellip">
									<a href="./notice/noticeView.notice?num=${arlist[i].notice_num}" style="color: #000;">
										<img src="./resources/images/home/icon_box.png" style="padding: 0 4px 1px 0;">
										${arlist[i].title}</a>
									</div>
								</td>
								</tr>
							</tbody>
						</c:forEach>
					</table>
				</div>
			</div>

			<div
				style="float: left; width: 33%; height: 74px; text-align: center;">
				<img src="./resources/images/home/cs_info.png"
					style="padding: 5px 0;" alt="고객센터안내">
			</div>

			<div style="clear: both;"></div>
		</div>
	</div>
	
	
	

	<c:import url="./temp/footer.jsp"></c:import>
</body>



</html>
