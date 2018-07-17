<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>TesteTwitter</title>
</head>
<body>
	<c:forEach var="twitter" items="${publicacao}">
		<h4>${canal}</h4>
		<h6>${twitter}</h6>
		<br>
		<br>
	</c:forEach>

</body>
</html>