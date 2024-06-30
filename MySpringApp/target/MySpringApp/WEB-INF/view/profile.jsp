<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %>
<%@ page import="java.util.Base64" %>
<%@ page import="javax.xml.bind.DatatypeConverter" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Profile</title>
<link rel = "stylesheet" href = "https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css">
<link rel = "stylesheet" href = "https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script src = "https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
<div class="container rounded bg-white mt-5 mb-5 d-flex justify-content-center align-items-center">
    <div class="row">
        <div class="col-md-3 border-top border-bottom">
            <!-- <div class="d-flex flex-column align-items-center text-center p-3 py-5"><img class="rounded-circle mt-5" width="150px" src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg"><span class="font-weight-bold">Edogaru</span><span class="text-black-50">edogaru@mail.com.my</span><span> </span></div> -->
        </div> 
        <div class="col-md-5 border-top border-bottom">
            <div class="p-3 py-5">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <h4 class="text-right">User Profile</h4>
                </div>
                <div class="row mt-2">
                    <div class="col-md-6"><label class="labels">FirstName: </label><input type="text" class="form-control" value="${user.firstname}" readonly></div>
                    <div class="col-md-6"><label class="labels">Lastname</label><input type="text" class="form-control" value="${user.lastname}" readonly></div>
                </div>
                <div class="row mt-3">
                   <%--  <div class="col-md-12"><label class="labels">Date of birth</label><input type="date" name = dateofbirth class="form-control" value="${user.dateofbirth}" readonly></div> --%>
                    <div class="col-md-12"><label class="labels">Date of birth</label><input type="date" name = dateofbirth class="form-control" value="<fmt:formatDate value="${user.dateofbirth}" pattern="yyyy-MM-dd" />" readonly></div>
                    <div class="col-md-12"><label>Gender:</label><input type="text" name="Gender" class="form-control" value="${user.gender}" readonly> </div>
                    <div class="col-md-12"><label class="labels">Email</label><input type="text" class="form-control" value="${user.email}" readonly></div>
                    <div class="col-md-12"><label class="labels">MobileNumber</label><input type="text" class="form-control" value="${user.mobilenumber}" readonly></div>
                    <div class="col-md-12"><label class="labels">Password</label><input type="password" class="form-control" value="${user.password}" readonly></div>
					<div class="col-md-12"><label class="labels">Languages</label>
					<input type="text" readonly class="form-control" id="languagesInput" value=
						"<c:forEach items='${user.languages}' var='language'>${language} 
						</c:forEach>">					 
					</div> 
                    <div class="col-md-12"><label class="labels">Image</label>
        				<%-- <img src="data:image/jpeg;base64, ${Base64.getEncoder().encodeToString(user.imagedata)} " style="max-width: 80px; max-height: 50px;"> --%>
						<c:set var="imgdata" value="${user.imgdata}" />
					        <c:choose>
					            <c:when test="${not empty imgdata}">
					                <img src="data:image/jpeg;base64,${Base64.getEncoder().encodeToString(imgdata)}" style="max-width: 80px; max-height: 50px;" alt="Profile Image">
					            </c:when>
					            <c:otherwise>
					                <p>No profile picture available</p>
					            </c:otherwise>
					        </c:choose>
					</div>
                    <div class="col-md-12"><label class="labels">Hobbies</label>
                    	<input type="text" id="hobbiesInput" readonly class="form-control" value="<c:forEach items='${user.hobbies}' var='hobby'>${hobby} </c:forEach>">	    
                	</div>
              		<div class="col-md-12"><label class="labels">Country</label><input type="text" class="form-control" value="${user.country}" readonly></div>
               		<div class="mt-5 text-center">
					    <form action="showeditprofile" method="get">
					        <button class="btn btn-primary profile-button" type="submit">Edit Profile</button>
					    </form>
					</div>
               		<div class="row mt-5 text-center">
        				<form action="logout" method="post">
            			<button class="btn btn-danger" type="submit">Logout</button>
       					 </form>
  					</div>
  					<c:if test="${loginsuccess}">
			        	<script>
			            $(document).ready(function() {
			                $.bootstrapGrowl("Logged In Successfully", {
			                    type: 'success',
			                    offset: { from: "top", amount: 20 },
			                    align: 'center',
			                    delay: 1500,
			                    allow_dismiss: false
			                });
			            });
			        	</script>
			        	<c:remove var="loginsuccess" scope="session"/>
		   			 </c:if>
			    	<c:if test="${editsuccess}">
			        	<script>
			            $(document).ready(function() {
			                $.bootstrapGrowl("Edited Successfully", {
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
            </div>
        </div>
    </div>
</div>
</div>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-growl/1.0.0/jquery.bootstrap-growl.min.js" ></script>
<script>
	  window.addEventListener('DOMContentLoaded', function() {
		    var languagesInput = document.getElementById('languagesInput');
		    var languagesArray = languagesInput.value.split(/\s+/).filter(Boolean);
		    var languageValue = languagesArray.join(', '); 
		    languagesInput.value = languageValue;
		    
		    var hobbiesInput = document.getElementById('hobbiesInput');
		    var hobbiesArray = hobbiesInput.value.split(/\s+/).filter(Boolean);		
		    var hobbiesValue = hobbiesArray.join(', '); 
		    hobbiesInput.value = hobbiesValue;
		  });
</script>
</body>
</html>