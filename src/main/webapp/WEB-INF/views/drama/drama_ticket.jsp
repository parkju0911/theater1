<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<select id="drama_ticket" name="ticket_numbers">
		<optgroup label="매수설정">
			<option id="select_ticket">매수 설정</option>
			<c:if test="${ticket ne 0}">
				<c:forEach begin="1" end="${ticket}" var="i">
					<option>${i }</option>
				</c:forEach>
			</c:if>
	 	</optgroup>
	</select>
</html>