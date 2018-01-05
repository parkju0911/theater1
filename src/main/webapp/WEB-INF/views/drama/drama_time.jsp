<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<script type="text/javascript">
	$(function(){
		var drama_time='';
		$('#drama_time').change(function(){
			if($('#drama_time').val()!='시간 선택'){
				drama_time = $('#drama_time').val();
			}
			$(".drama_ticket").load('dramaTicket?drama_num=${view.drama_num}&&drama_date=${view.drama_date}&&drama_time='+drama_time);
		});
		$(".drama_ticket").load('dramaTicket?drama_num=${view.drama_num}&&drama_date=${view.drama_date}&&drama_time='+drama_time);
	});
</script>
	<select id="drama_time" name="drama_time">
		<optgroup label="시간 선택">
			<option id="select_time">시간 선택</option>
			<c:forEach items="${time}" var="dto">							
				<option>${dto.drama_time }</option>
			</c:forEach>
		</optgroup>
	</select>
	<div class="drama_ticket"></div>
</html>