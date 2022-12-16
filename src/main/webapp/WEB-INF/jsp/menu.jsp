<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Categories</title>
</head>
<body>
<div class="container-fluid">
 <div class="row">
   		<div class="col-3" style="padding-top: 62px;">
			<h2 id="title" style="padding-left: 15px;">MENU</h2>
		</div>
	</div>
<table class="table table-striped table-hover table-light" >
		<thead>
		<tr id="first-row" class="table">
			<td scope="row" style="padding-left: 20px;">Id</td>
			<td scope="row" style="padding-left: 20px;"> name</td>
		</tr>
		</thead>
		
		<c:forEach var="category" items="${categories}">
			<tr>
				<td style="padding-left:20px;" >${category.id}</td>
				<td style="padding-left:20px;" >${category.name}</td>
				<td style="padding-left:20px;" >
				<br>
				<button> 
					<img src="/red/pic/${category.name}.PNG" alt=" ${category.name}" width="200px" >
				</button>
				</td>
				
			</tr>
		</c:forEach>
	</table>
</div>

		
		

</body>
</html>