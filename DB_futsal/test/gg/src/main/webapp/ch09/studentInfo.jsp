<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보</title>
</head>
<body>
  <h2>정보</h2>[<a href="/gg/studentControl">새로고침</a>]
  <hr>
  <table border = "1">
    <tr>
      <th>DEPTNO</th>
      <th>DNAME</th>
      <th>EMPNO</th>
      <th>ENAME</th>
      <th>SAL</th>
    </tr>
    <c:forEach items = "${students}" var="s">
      <tr>  
        <td>${s.DEPTNO }</td>
        <td>${s.DNAME }</td>
        <td>${s.EMPNO }</td>
        <td>${s.ENAME }</td>
        <td>${s.SAL }</td>
      </tr>
    </c:forEach>  
  </table>
</body>
</html>