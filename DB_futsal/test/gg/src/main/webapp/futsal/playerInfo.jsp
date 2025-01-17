<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>플레이어 정보</title>
</head>
<body>
  <h2>플레이어 정보</h2>[<a href="/gg/playerControl?action=list">조회</a>]
  <hr>
  <table border="1">
    <tr>
      <th>RRN</th>
      <th>Name</th>
      <th>Address</th>
      <th>Team ID</th>
      <th>Rank ID</th>
    </tr>
    <c:forEach items="${players}" var="p">
      <tr>  
        <td>${p.RRN}</td>
        <td>${p.NAME}</td>
        <td>${p.ADDRESS}</td>
        <td>${p.TEAM_ID}</td>
        <td>${p.RANK_ID}</td>
      </tr>
    </c:forEach>  
  </table>
  <hr>
  
  <h3>플레이어 랭크 업데이트</h3>
  <form action="/gg/playerControl" method="post">
    <input type="hidden" name="action" value="updateRank">
    RRN: <input type="text" name="rrn" required><br>
    New Rank ID: <input type="text" name="newRankId"><br>
    <input type="submit" value="Update Rank">
  </form>
  <hr>
  
  <h3>팀 별 플레이어 수 조회</h3>
  <form action="/gg/playerControl" method="post">
    <input type="hidden" name="action" value="teamPlayerCount">
    <input type="submit" value="View Team Player Count">
  </form>
  <hr>
  
 <h3>특정 팀의 플레이어 조회</h3>
  <form action="/gg/playerControl" method="post">
    <input type="hidden" name="action" value="playersByTeam">
    Team ID: <input type="text" name="teamId" required><br>
    <input type="submit" value="View Players By Team">
  </form>
  <hr>
  
  <h3>전체 경기 일정 조회</h3>
  <form action="/gg/playerControl" method="get">
    <input type="hidden" name="action" value="listSchedules">
    <input type="submit" value="View All Schedules">
  </form>
  <hr>
  
  <h3>특정 날짜의 경기 일정 조회</h3>
  <form action="/gg/playerControl" method="get">
    <input type="hidden" name="action" value="scheduleInfo">
    날짜: <input type="date" name="date"><br>
    <input type="submit" value="View Schedules By Date">
  </form>
  <hr>
  
  <h3>특정 경기장의 경기 일정 조회</h3>
  <form action="/gg/playerControl" method="get">
    <input type="hidden" name="action" value="schedulesByStadium" >
    경기장 이름: <input type="text" name="stadiumName" required><br>
    <input type="submit" value="View Schedules By Stadium">
  </form>
  <hr>
  
  <h3>플레이어 팀 업데이트</h3>
  <form action="/gg/playerControl" method="post">
    <input type="hidden" name="action" value="updateTeam">
    RRN: <input type="text" name="rrn" required><br>
    New Team ID: <input type="text" name="newTeamId" required><br>
    <input type="submit" value="Update Team">
  </form>
  <hr>
  
  <h3>경기 일정 삭제</h3>
  <form action="/gg/playerControl" method="post">
    <input type="hidden" name="action" value="deleteSchedule">
    Schedule ID: <input type="text" name="scheduleId" required><br>
    <input type="submit" value="Delete Schedule">
  </form>
  <hr>
  
  <h3>플레이어 삭제</h3>
  <form action="/gg/playerControl" method="post">
    <input type="hidden" name="action" value="deletePlayer">
    RRN: <input type="text" name="rrn" required><br>
    <input type="submit" value="Delete Player">
  </form>
  
  
</body>
</html>
