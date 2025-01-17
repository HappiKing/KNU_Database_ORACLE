<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>경기 일정</title>
</head>
<body>
  <h2>경기 일정</h2>[<a href="/gg/playerControl?action=schedulesByDate">새로고침</a>]
  <hr>
  <table border="1">
    <tr>
      <th>Schedule ID</th>
      <th>Schedule Date</th>
      <th>Stadium Name</th>
    </tr>
    <c:forEach items="${schedules}" var="s">
      <tr>  
        <td>${s.schedule_id}</td>
        <td>${s.schedule_date}</td>
        <td>${s.stadium_name}</td>
      </tr>
    </c:forEach>  
  </table>
  
  <hr>
  <form action="/gg/playerControl" method="get">
    <input type="hidden" name="action" value="list">
    <input type="submit" value="Back to Player Info">
  </form>
</body>
</html>
