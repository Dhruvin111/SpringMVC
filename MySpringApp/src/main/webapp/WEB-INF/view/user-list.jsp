<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Collections" %>
<%@ page import="java.util.Base64" %>
<%@ page isELIgnored="false" %>

<html>
<head>
    <title>User List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.css">
	<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.js">
	</script> 
    
    <style>
    .table-heading hr {
            border-top: 2px solid black;
            width: 100%;
        }
    </style>
    <script>
    
        $(document).ready(function() {
            $('.delete-btn').click(function() {
                var id = $(this).data('userid');
                $('#confirmDelete').data('userid', id); 
            });

            $('#confirmDelete').click(function() {
                var id = $(this).data('userid');
                $.ajax({
                    url: '<%=request.getContextPath()%>/delete?id=' + id ,
                    type: 'GET',
                    success: function(response) {
                        location.reload(); 
                    },
                    error: function(xhr, status, error) {
                        alert('Error deleting user: ' + error);
                    }
                });
            });
            $('#table').DataTable();        
        });
        window.addEventListener('DOMContentLoaded', function() {
	        var languageCells = document.querySelectorAll('td:nth-child(7)');
	        languageCells.forEach(function(cell) {
	            var languagesArray = cell.textContent.trim().split(/\s+/).filter(Boolean);
	            var languageValue = languagesArray.join(', '); 
	            cell.textContent = languageValue;
	        });    	        
	        var hobbyCells = document.querySelectorAll('td:nth-child(8)');
	        hobbyCells.forEach(function(cell) {
	            var hobbiesArray = cell.textContent.trim().split(/\s+/).filter(Boolean);     
	            var hobbiesValue = hobbiesArray.join(', '); 
	            cell.textContent = hobbiesValue;
	        });
	    });
    </script>
</head>
<body>
    <header>
        <nav class="navbar navbar-expand-md navbar-dark" style="background-color: blue">
		    <div class="container-fluid">
		        <p class="text-white">Admin Panel</p>
		    <div class="mx-auto">																												
                <c:if test="${not empty loginSuccessMessage}">																				
                    <div id="loginSuccessAlert" class="alert alert-success alert-dismissible fade show" role="alert" style="width: 500px; max-width: 90%; height: auto;  padding: 0.6rem 1.25rem; font-size: 0.9rem;">
                        ${loginSuccessMessage}
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </c:if>
            </div>
		    </div>
		    <form action="logout" method="post">
            	<button class="btn btn-danger" type="submit">Logout</button>
       		</form>
		</nav>
    </header>
    <br>
<div class="container-fluid">
    <div class="row">
    	<div class = "col-md-10">
        <div class="container">
            <h3 class="text-center table-heading">List of Users</h3>
            <hr style="border-top: 2px solid black; width: 100%;">
            <br>             
                <table id="table" class="table table-bordered">
                    <thead>
                        <tr>
				            <th>ID</th>
            				<th>Firstname</th>
            				<th>Lastname</th>
				            <th>Date</th>
				            <th>Email</th>
				            <th>MobileNumber</th>
				            <th>Languages</th>
				            <th>Hobbies</th>
				            <th>Gender</th>
				            <th>Country</th>
				            <th>Image</th>
				            <th>Actions</th>
				            <th>Actions</th>
                        </tr>
                    </thead>

            		<tbody>
            			<c:forEach var="user" items="${listuser}">
            			<tr>
            				<td>${user.id}</td>
				            <td>${user.firstname}</td>
				            <td>${user.lastname}</td>
				            <td>${user.dateofbirth}</td>
				            <td>${user.email}</td>
				            <td>${user.mobilenumber}</td>
				            <td>
				           		<c:forEach var="language" items="${user.languages}">
    							${language}<br>
								</c:forEach></td>
							<td>
				           		<c:forEach var="hobby" items="${user.hobbies}">
    							${hobby}<br>
								</c:forEach></td>
				            <td>${user.gender}</td>
				            <td>${user.country}</td>
 				            <td>
	 				            <c:if test="${not empty user.imgdata}">
						        <img src="data:image/jpeg;base64,${Base64.getEncoder().encodeToString(user.imgdata)}"
						            style="max-width: 80px; max-height: 50px;">
						    	</c:if>
					   		</td>
     						<td>
	    						<button type="button" class="btn btn-primary btn-sm" onclick="window.location.href='<c:url value='/editpage?id=${user.id}' />'">Edit</button>&nbsp;&nbsp;&nbsp;&nbsp; 	</td>					
	    					<td>	
	    						<button type="button" class="btn btn-primary btn-sm delete-btn" data-bs-toggle="modal" data-bs-target="#exampleModal" data-userid="${user.id}">Delete</button>    						
							</td>
            			</tr>
            			</c:forEach>
            		
            		</tbody>
                </table>
            
        </div>
    </div>
    <div class="text-center">
        <div class="row mt-3">
            <div class="col-md-12">
                <form action="logout" method="post">
            		<button class="btn btn-danger" type="submit">Logout</button>
       			</form>
            </div>
        </div>
    </div>
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Confirm Delete</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                Are you sure you want to delete this user??
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-danger" id="confirmDelete">Delete</button>
            </div>
        </div>
    </div>
    </div>
</div>
</div>  
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-growl/1.0.0/jquery.bootstrap-growl.min.js" ></script>
    <script>
    $(document).ready(function() {
        setTimeout(function() {
            $("#loginSuccessAlert").alert('close');
        }, 1000);
    });
    </script>
    <c:if test="${editsuccess}">
		<script>
			$(document).ready(function() {
                $.bootstrapGrowl("Edited Successfully!", {
                    type: 'success',
			        offset: { from: "top", amount: 20 },
		            align: 'center',
		            delay: 1500,
	                allow_dismiss: false
			        });
			    });
		</script>
		<c:remove var="editsuccess" scope="session"/>
	</c:if>
	
	<c:if test="${deletesuccess}">
		<script>
			$(document).ready(function() {
                $.bootstrapGrowl("Deleted Successfully!", {
                    type: 'success',
			        offset: { from: "top", amount: 20 },
		            align: 'center',
		            delay: 1500,
	                allow_dismiss: false
			        });
			    });
		</script>
		<c:remove var="deletesuccess" scope="session"/>
	</c:if>
				   		
</body>
</html>