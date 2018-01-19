<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=v1_dhkpTCMdne9dcmd_k&submodules=geocoder"></script>
<title>Insert title here</title>
</head>
<body>
				<div class="view_page">
		
		
		<div id="warning">
		<div id="warning_tool">
		<div id="images_noti">
		<img alt="" src="../resources/images/starpoint/noti.png">
		</div>
		<p id="warning_text1">예매 전 안내 및 주의사항을 꼭 확인하세요!</p>
	
		<p>티켓에 따라 이용방법/환불규정이 상이합니다. <a href="#menu3" id="refund_1" style="color:red;">환불규정 바로가기 > </a></p>
		</div>
		</div>

<div id="info_one">
	<p style="font-weight: bolder;">예매정보</p>

	<p>공연기간: 오픈런</p>

	<p>예매가능시간: 공연 10분 전 까지</p>
</div>

 
<div id="info_two">
	<p style="font-weight: bolder;">관람정보</p>

	<p>관람등급: 만 8세 이상(신분증/학생증 지참)</p>

	<p>공연시간: 약 100분</p>

	<p>티켓배부: 현장수령 (공연 1시간 전부터 공연장 앞 매표소 배부)</p>

	<p>티켓교환: 문자/마이티켓 제시 및 본인확인 후 발권</p>

	<p>좌석배정: 타예매처 지정석 제외 후 매표소 선착순 배정(앞→뒤, 중앙→사이드)</p>

	<p>입장시간: 공연 시작 10분 전 부터 입장 가능</p>

</div>
 
 <div id="info_three">
 
	<p style="font-weight: bolder;">주의사항</p>

	<p style="color:red";>※타임티켓은 비지정석 예매입니다. 상단 좌석배정 방식을 확인하세요!</p>

	<p style="color:red";>※당일 관람티켓 취소/환불/변경 불가 - 신중히 구매해주세요.</p>

	<p>공연 시작 후 입장 불가, 공연 중 퇴장 시 재입장 불가</p>

	<p>지각으로 관람하지 못할 시 취소/환불/변경 불가</p>

	<p>관람 연령 미숙지로 인한 취소/환불/변경 불가</p>

	<p>음식물 반입 금지, 공연 중 사진/동영상 촬영 금지</p>

	<p>공연 취소/변경 발생시, 개별 연락을 드릴 수 있습니다.</p>

	<p id="map_info">지도에서 미리 확인하세요</p>
	<p>공연장: 대학로 쁘띠첼씨어터</p>

	<p>주소: ${view2.place}</p>

	<p>주차여부: 주차불가(인근 유료주차장 이용)</p>

	<p>문의전화: 02-766-7667</p>
		 <div id="map" style="width:700px;height:350px; margin-left: 30px;"></div>
    <script type="text/javascript">

    	var map = new naver.maps.Map('map');
        var myaddress = '${view2.place}';// 도로명 주소나 지번 주소만 가능 (건물명 불가!!!!)
        naver.maps.Service.geocode({address: myaddress}, function(status, response) {
            if (status !== naver.maps.Service.Status.OK) {
                return alert(myaddress + '의 검색 결과가 없거나 기타 네트워크 에러');
            }
            var result = response.result;
            // 검색 결과 갯수: result.total
            // 첫번째 결과 결과 주소: result.items[0].address
            // 첫번째 검색 결과 좌표: result.items[0].point.y, result.items[0].point.x
            var myaddr = new naver.maps.Point(result.items[0].point.x, result.items[0].point.y);
            map.setCenter(myaddr); // 검색된 좌표로 지도 이동
            // 마커 표시
            var marker = new naver.maps.Marker({
              position: myaddr,
              map: map
            });
            // 마커 클릭 이벤트 처리
            naver.maps.Event.addListener(marker, "click", function(e) {
              if (infowindow.getMap()) {
                  infowindow.close();
              } else {
                  infowindow.open(map, marker);
              }
            });
            // 마크 클릭시 인포윈도우 오픈
            var infowindow = new naver.maps.InfoWindow({
                content: '<h4>[Teatro]</h4><a href="##" target="_blank"><img src="../resources/images/common/teatro_logo4.png" style="width:100px;height:100px;"></a>'
            });
        });

      
      </script>
		
		</div><!-- info three close -->
		
		</div>
</body>
</html>