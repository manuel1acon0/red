<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="/red/css/red.css">
	<title>Insert title here</title>
</head>

<body>
	<div class="container-fluid">
	 	<div class="row">
   	

	</div>
<table class="table table-striped table-hover table-light" >
		<thead>
		<tr id="first-row" class="table">
			<td scope="row" style="padding-left: 20px;">Nome</td>
			<td scope="row" style="padding-left: 20px;">Descrizione</td>
			<td scope="row" style="padding-left: 20px;">Prezzi</td>
		</tr>
		</thead>
		
		<c:forEach var="detail" items="${details}">
			<tr>
				<td style="padding-left:20px;" >${detail.name}</td>
				<td style="padding-left:20px;" >${detail.description}</td>
				<td style="padding-left:20px;" >${detail.price}</td>
				<td style="padding-left:20px;" >
				<br>
<%-- 				<a href="/menu?id=${category.id}" > --%>
				<button> 
					<img src="/red/pic/${detail.name}.PNG" alt=" ${detail.name}" width="200px" >
				</button>
<!-- 				</a> -->
				</td>
				
			</tr>
		</c:forEach>
	</table>
</div>
</body>
</html>