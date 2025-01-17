<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팀 별 플레이어 수</title>
</head>
<body>
  <h2>팀 별 플레이어 수</h2>[<a href="/gg/playerControl?action=teamPlayerCount">새로고침</a>]
  <hr>
  <table border="1">
    <tr>
      <th>Team ID</th>
      <th>Player Count</th>
    </tr>
    <c:forEach items="${teamPlayerCounts}" var="t">
      <tr>  
        <td>${t.Team_id}</td>
        <td>${t.Player_Count}</td>
      </tr>
    </c:forEach>  
  </table>
  <form action="/gg/playerControl" method="get">
    <input type="hidden" name="action" value="list">
    <input type="submit" value="Back to Player Info">
  </form>
</body>
</html>
