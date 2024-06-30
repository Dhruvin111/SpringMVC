<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

<style>
{
	h6{
		color: red;
	}
}
@import url('https://fonts.googleapis.com/css?family=Poppins:400,500,600,700&display=swap');
*{
    margin: 0;
    padding:0;
    box-sizing: border-box;
    font-family: 'Poppins', sans-serif;
  } 
  
    body{
    min-height: 100vh;
    display: flex;
    align-items: center;
    justify-content: center;
    background: #4070f4;
  }
  
  .container{
    position: relative;
    max-width: 630px;
    width: 100%;
    background: #fff;
    height : 400px;
    padding: 34px;
    border-radius: 6px;
    box-shadow: 0 5px 10px rgba(0,0,0,0.2);
  }
  .container h2{
    position: relative;
    font-size: 22px;
    font-weight: 600;
    color: #333;
  }
    .container h2::before{
    content: '';
    position: absolute;
    left: 0;
    bottom: 0;
    height: 3px;
    width: 60px;
    border-radius: 12px;
    background: #4070f4;
  }
  .container form{
    margin-top: 10px;
  }
  .container form .input-box{
    height: 52px;
    margin: 18px 0;
  }
  form .input-box input{
    height: 30px;
    width: 200px;
    outline: none;
    padding: 0 15px;
    font-size: 17px;
    font-weight: 400;
    color: #333;
    border: 1.5px solid #C7BEBE;
    border-bottom-width: 2.5px;
    border-radius: 6px;
    transition: all 0.3s ease;
  }
  form h3{
    color: #707070;
    font-size: 17px;
    font-weight: 500;
    margin-left: 10px;
    align-items: center;
  }
   .input-box.button {
    display: flex;
    justify-content: center;
    margin-top: 20px; /* Adjust as needed */
  }

</style>
<link rel="stylesheet" type="text/css" href="style-2.css">
<script src = "script.js" type="text/javascript"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<div class = "container">
	<h2>Login</h2>
	<form action="login" method = "post">
		<div class = "input-box">
			Email: <input type = "text" id = email name = "email">
			<h6 style="color: red;" id="emailcheck"> </h6>
		</div>
		<div class = "input-box">
			Password: <input type = "password" id = password name = "password">
			<h6 style="color: red;" id="passwordcheck"> </h6>
		</div>	
		<div class="form-link">
            <a href="forgotpassword.jsp" class="link signup-link" onclick="redirectToForgotPassword()">Forgot password?</a>
        </div>
        <div class="input-box button">
           <button class= "btn btn-primary" id= "submit">Login</button>
        </div>
        <div class="form-link">
           <h3>Don't have an account? <a href="<c:url value='/' />">Register</a></h3>
        </div>
	</form>
	</div>
	 <c:if test="${sessionScope.error == true}">
        <script>
            $(document).ready(function() {
                $.bootstrapGrowl("Invalid password. Please try again.", {
                    type: 'danger',
                    align: 'center',
                    delay: 1500 
                });
            });
        </script>
        <c:remove var="error" scope="session" />
    </c:if>
    
    <c:if test="${sessionScope.success == true}">
        <script>
            $(document).ready(function() {
                $.bootstrapGrowl("Registered Successfully!", {
                    type: 'success',
                    align: 'center',
                    delay: 1500,
                    allow_dismiss: true
                });
            });
        </script>
        <c:remove var="success" scope="session" />
    </c:if>  
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-growl/1.0.0/jquery.bootstrap-growl.min.js" ></script>
<script>

 $(document).ready(function () {
	let emailPattern = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.(com|org|net|edu|gov|info|io))$/;
    let emailError = true;

    $("#email").on("input", function () {
      validateEmail();
    });
    
    $("#submit").on("click", function (e) {
      validateEmail();
      if (!emailError) {
        e.preventDefault();
      }
    });
		
    function validateEmail() {
        let emailValue = $("#email").val();
        
        if (emailValue.trim().length ===0) {
          $("#emailcheck").html("**email is missing");
          emailError = false;
        } else if (!emailPattern.test(emailValue)) {
          $("#emailcheck").html("**Invalid email format");
          emailError = false;
        } else {
           $("#emailcheck").html("");
          emailError = true;
        }
      }
    
    let passwordError = true;
    $("#password").on("input", function () {
      validatepassword();
    });
    
    $("#submit").on("click", function (e) {
      validatepassword();
      if (!passwordError) {
        e.preventDefault();
      }
    });
		
     function validatepassword() {
        let passwordValue = $("#password").val();

        if (passwordValue.trim().length ===0) {
          $("#passwordcheck").html("**Password is missing");
          passwordError = false;
        } else {
           $("#passwordcheck").html("");
          passwordError = true;
        }
      }
  });
 
/* function redirectToRegister(){
	 window.location.href = "register.jsp";
}
 */
function redirectToForgotPassword(){
	 window.location.href = "forgotpassword.jsp";
}
</script>
</html> 
 