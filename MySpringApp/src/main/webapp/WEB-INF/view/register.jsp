<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="register" method="post">
		<input type="text" name="Name" id="name" /><br>
		<input type="text" name="Email" id="email" /><br> 
		<input type="submit" name=submit>
	</form>
</body>
</html> --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration</title>
<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<style>
@charset "UTF-8";
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

  .wrapper{
    position: relative;
    max-width: 630px;
    width: 100%;
    background: #fff;
    padding: 34px;
    border-radius: 6px;
    box-shadow: 0 5px 10px rgba(0,0,0,0.2);
  }
  .wrapper h2{
    position: relative;
    font-size: 22px;
    font-weight: 600;
    color: #333;
  }

  .wrapper h2::before{
    content: '';
    position: absolute;
    left: 0;
    bottom: 0;
    height: 3px;
    width: 135px;
    border-radius: 12px;
    background: #4070f4;
  }

  .wrapper form{
    margin-top: 10px;
  }

  .wrapper form .input-box{
    height: 52px;
    margin: 18px 0;
  }
  
  select{
    width: 30em;
  }
  form .input-box input{
    height: 30px;
    width: 300px;
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
  .gender-box {
    margin-top: 20px;
    display: flex;
    align-items: center;
  }
  .gender-box label {
    margin-right: 10px;
    font-size: 17px;
    font-weight: 400;
    color: #333;
  }
  
  .gender-box input[type="radio"] {
    margin-right: 5px;
  }
  form h3{
    color: #707070;
    font-size: 17px;
    font-weight: 500;
    margin-left: 10px;
    align-items: center;
  }
  .input-box.button input{
    color: #fff;
    letter-spacing: 1px;
    border: none;
    background: #4070f4;
    cursor: pointer;
  }
  .input-box.button {
    display: flex;
    justify-content: center;
    margin-top: 20px; /* Adjust as needed */
  }
  .input-box.button input:hover{
    background: #0e4bf1;
  }
  form .text h3{
    color: #333;
    width: 100%;
    text-align: center;
   }
   form .text h3 a{
    color: #4070f4;
    text-decoration: none;
  }
  form .text h3 a:hover{
    text-decoration: underline;
  }

  .hobbies-options {
    display: flex;
    gap: 10px;
  }
  
  .hobby-option {
    display: flex;
    align-items: center;
  }
  
  .hobby-option label {
    margin-right: 5px;
  }

  .input-box input[type="checkbox"] {
    transform: scale(0.8); 
    margin-right: 3px; 
  }
  
  #birthdate {
    width: 125px;
    font-size: 12px;
}

#age{
	width: 50px;
	font-size: 12px;
}
#child,#adult{
	width: 10px;
	height: 10px;
	
}
#usercheck,#emailcheck,#dateOfBirthCheck,#Gendercheck,#phonecheck,#passwordcheck,#languagecheck,#countrycheck,#imagecheck,#hobbiesCheck,#lastnamecheck {
    color: red;
}

</style>
</head>
<body>
<div class = "wrapper">
 	<h2>Registration</h2>
	<form id = "myform" action = "register" method = "post" enctype="multipart/form-data">
		<div class="row mt-1">
		<div class="input-box">
		    <label for="firstname">First Name:</label>
		    <input type="text" id="firstname" name="firstname">
		    <h6 id="usercheck">**Firstname is missing</h6>
		</div>
		</div>
		
		<div class = "row mt-1">
	  	<div class="input-box">
		    <label for="lastname">Last Name:</label>
		    <input type="text" id="lastname" name="lastname">
   	        <h6 id="lastnamecheck">**Lastname is missing</h6>
      	</div>
      	</div>
      	
      	<div class = row mt-1>
      	<div class="input-box">
		    <label for="birthdate">Date of Birth:</label>
		    	<input type="date" id="birthdate" name="dateofbirth">
		    <label for="age">Age:</label>
		      	<input type="text" id="age" name="Age" readonly>
		      	<input type="radio" id="child" name="AgeGroup" value="child" disabled>
		    <label for="Male">Child</label>
			  	<input type="radio" id="adult" name="AgeGroup" value="adult" disabled>
			<label for="Adult">Adult</label>
			<h6 id="dateOfBirthCheck">**Date is missing</h6>
      	</div>
      	</div>
      	
      	<div class = row mt-1>
	  	<div class="gender-box">
	   		<label>Gender:</label>
	      		<input type="radio" id="Male" name="gender" value="male">
	      	<label for="Male">Male</label>
	      		<input type="radio" id="Female" name="gender" value="female">
	      	<label for="Female">Female</label>
  	  	</div>
  	  	<h6 id="Gendercheck">**Select Gender</h6>
  	  	</div>
      	
		<div class = row mt-1>
      	<div class="input-box">
			<label for="email">Email:</label>
		  		<input type="email" id="email" name="email">
		  	<h6 id="emailcheck">**email is missing</h6>
      	</div>
		</div>
		
		<div class = row mt-1>
      	<div class="input-box">
	      	<label for="phone">Mobile number:</label>
	      		<input type="tel" id="phone" name="mobilenumber" pattern="[1-9]{1}[0-9]{9}" maxlength="10">
	      	<h6 id="phonecheck">**Phone Number is missing</h6>
      	</div>
      	</div>
		
      	<div class="input-box">
	    	<label for="password">Password:</label>
	      		<input type="password" id="password" name="password">
	      	<h6 id="passwordcheck">**Password is missing</h6>
      	</div>
      	
      	<div class = row mt-1>
      	<div class="input-box">
	    	<label for="languages">Languages:</label>
	      	<select id = "multipleSelect" name="languages" placeholder="Select Languages" data-search="true" data-silent-initial-value-set="true" multiple= "multiple">
		        <option value="English">English</option>
		        <option value="Hindi">Hindi</option>
		        <option value="Gujarati">Gujarati</option>
	      	</select>
          	<h6 id="languagecheck">**Please select at least one language</h6>
      	</div>
      	</div>
      	<div class="input-box">
	    	<label for="image">Insert Image:</label>
	    		<input type="file" id="image" name="image" accept="image/*">
	      	<h6 id="imagecheck">**Insert Image</h6>
      	</div>
      	
      	<div class="input-box">
	    	<label>Hobbies:</label>
	      	<div class = "hobbies-options">
			      Reading <input type="checkbox" class="hobby-checkbox" name="hobbies" value="Reading"> 
			      Writing <input type="checkbox" class="hobby-checkbox" name="hobbies" value="Writing"> 
			      Cricket <input type="checkbox" class="hobby-checkbox" name="hobbies" value="Cricket">
	      	</div>
      	</div>
     	<h6 id="hobbiesCheck">**Select atleast one hobby</h6>
     	
     	
      	<div class="input-box">
	    	<label for="country">Country:</label>
	      	<select id= "country" name = "country" placeholder="Select Country">
		        <option value="">Select a Country</option>
		        <option value="Afghanistan">Afghanistan</option>
		        <option value="Albania">Albania</option>
		        <option value="Algeria">Algeria</option>
		        <option value="American Samoa">American Samoa</option>
		        <option value="Andorra">Andorra</option>
		        <option value="Angola">Angola</option>
		        <option value="Anguilla">Anguilla</option>
		        <option value="Antartica">Antarctica</option>
		        <option value="Antigua and Barbuda">Antigua and Barbuda</option>
		        <option value="Argentina">Argentina</option>
		        <option value="Armenia">Armenia</option>
		        <option value="Aruba">Aruba</option>
		        <option value="Australia">Australia</option>
		        <option value="Austria">Austria</option>
		        <option value="Azerbaijan">Azerbaijan</option>
		        <option value="Bahamas">Bahamas</option>
		        <option value="Bahrain">Bahrain</option>
		        <option value="Bangladesh">Bangladesh</option>
		        <option value="Barbados">Barbados</option>
		        <option value="Belarus">Belarus</option>
		        <option value="Belgium">Belgium</option>
		        <option value="Belize">Belize</option>
		        <option value="Benin">Benin</option>
		        <option value="Bermuda">Bermuda</option>
		        <option value="Bhutan">Bhutan</option>
		        <option value="Bolivia">Bolivia</option>
		        <option value="Bosnia and Herzegowina">Bosnia and Herzegowina</option>
		        <option value="Botswana">Botswana</option>
		        <option value="Bouvet Island">Bouvet Island</option>
		        <option value="Brazil">Brazil</option>
		        <option value="British Indian Ocean Territory">British Indian Ocean Territory</option>
		        <option value="Brunei Darussalam">Brunei Darussalam</option>
		        <option value="Bulgaria">Bulgaria</option>
		        <option value="Burkina Faso">Burkina Faso</option>
		        <option value="Burundi">Burundi</option>
		        <option value="Cambodia">Cambodia</option>
		        <option value="Cameroon">Cameroon</option>
		        <option value="Canada">Canada</option>
		        <option value="Cape Verde">Cape Verde</option>
		        <option value="Cayman Islands">Cayman Islands</option>
		        <option value="Central African Republic">Central African Republic</option>
		        <option value="Chad">Chad</option>
		        <option value="Chile">Chile</option>
		        <option value="China">China</option>
		        <option value="Christmas Island">Christmas Island</option>
		        <option value="Cocos Islands">Cocos (Keeling) Islands</option>
		        <option value="Colombia">Colombia</option>
		        <option value="Comoros">Comoros</option>
		        <option value="Congo">Congo</option>
		        <option value="Congo">Congo, the Democratic Republic of the</option>
		        <option value="Cook Islands">Cook Islands</option>
		        <option value="Costa Rica">Costa Rica</option>
		        <option value="Cota D'Ivoire">Cote d'Ivoire</option>
		        <option value="Croatia">Croatia (Hrvatska)</option>
		        <option value="Cuba">Cuba</option>
		        <option value="Cyprus">Cyprus</option>
		        <option value="Czech Republic">Czech Republic</option>
		        <option value="Denmark">Denmark</option>
		        <option value="Djibouti">Djibouti</option>
		        <option value="Dominica">Dominica</option>
		        <option value="Dominican Republic">Dominican Republic</option>
		        <option value="East Timor">East Timor</option>
		        <option value="Ecuador">Ecuador</option>
		        <option value="Egypt">Egypt</option>
		        <option value="El Salvador">El Salvador</option>
		        <option value="Equatorial Guinea">Equatorial Guinea</option>
		        <option value="Eritrea">Eritrea</option>
		        <option value="Estonia">Estonia</option>
		        <option value="Ethiopia">Ethiopia</option>
		        <option value="Falkland Islands">Falkland Islands (Malvinas)</option>
		        <option value="Faroe Islands">Faroe Islands</option>
		        <option value="Fiji">Fiji</option>
		        <option value="Finland">Finland</option>
		        <option value="France">France</option>
		        <option value="France Metropolitan">France, Metropolitan</option>
		        <option value="French Guiana">French Guiana</option>
		        <option value="French Polynesia">French Polynesia</option>
		        <option value="French Southern Territories">French Southern Territories</option>
		        <option value="Gabon">Gabon</option>
		        <option value="Gambia">Gambia</option>
		        <option value="Georgia">Georgia</option>
		        <option value="Germany">Germany</option>
		        <option value="Ghana">Ghana</option>
		        <option value="Gibraltar">Gibraltar</option>
		        <option value="Greece">Greece</option>
		        <option value="Greenland">Greenland</option>
		        <option value="Grenada">Grenada</option>
		        <option value="Guadeloupe">Guadeloupe</option>
		        <option value="Guam">Guam</option>
		        <option value="Guatemala">Guatemala</option>
		        <option value="Guinea">Guinea</option>
		        <option value="Guinea-Bissau">Guinea-Bissau</option>
		        <option value="Guyana">Guyana</option>
		        <option value="Haiti">Haiti</option>
		        <option value="Heard and McDonald Islands">Heard and Mc Donald Islands</option>
		        <option value="Holy See">Holy See (Vatican City State)</option>
		        <option value="Honduras">Honduras</option>
		        <option value="Hong Kong">Hong Kong</option>
		        <option value="Hungary">Hungary</option>
		        <option value="Iceland">Iceland</option>
		        <option value="India">India</option>
	        </select>
	      <h6 id="countrycheck">**Please select country</h6>
      	</div>

	  	<div class = "input-box button">
	  		<input id = "submit" name = "submit" type="submit" value="Submit" data-toggle="modal" data-target="#exampleModal">
	  	</div>
	  
	  	<div class="text">
      		<h3>Already have an account? <a href="<c:url value='/login' />">Login now</a></h3>
     	</div>
     	
      	<c:if test="${emailExists}">
        <script>
            alert('Email already exists!!'); 
        </script>
        <c:remove var="emailExists" scope="session"/>
    	</c:if>
    	
    	<c:if test="${phoneExists}">
        <script>
            alert('Number already exists!!'); 
        </script>
        <c:remove var="phoneExists" scope="session"/>
    	</c:if>
	</form>
		
	</div>
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
	<script>
	function redirectToLogin() {
	    window.location.href = "login.jsp";
	  }
	
     $(document).ready(function() {
    	    $('#multipleSelect').select2();

    	    $("#usercheck").hide();
    	    let usernameError = true;
    	    $("#firstname").on("input", function() {
    	        validateUsername();
    	    });
    	    $("#submit").on("click", function(e) {
    	        validateUsername();
    	        if (!usernameError) {
    	            e.preventDefault();
    	        }
    	    });
    	    function validateUsername() {
    	        let usernameValue = $("#firstname").val();
    	        if (usernameValue.trim().length === 0) {
    	            $("#usercheck").show();
    	            usernameError = false;
    	        } else if (!/^[a-zA-Z]+$/.test(usernameValue)) {
    	            $("#usercheck").show();
    	            $("#usercheck").html("**Only alphabets are accepted");
    	            userNameError = false;
    	        } else if (usernameValue.length < 3 || usernameValue.length > 10) {
    	            $("#usercheck").show();
    	            $("#usercheck").html("**Length of firstname must be between 3 and 10");
    	            usernameError = false;
    	        } else {
    	            $("#usercheck").hide();
    	            usernameError = true;
    	        }
    	    }

    	    $("#lastnamecheck").hide();
    	    let lastnameError = true;
    	    $("#lastname").on("input", function() {
    	        validateLastname();
    	    });
    	    $("#submit").on("click", function(e) {
    	        validateLastname();
    	        if (!lastnameError) {
    	            e.preventDefault();
    	        }
    	    });
    	    function validateLastname() {
    	        let lastnameValue = $("#lastname").val();
    	        if (lastnameValue.trim().length === 0) {
    	            $("#lastnamecheck").show();
    	            lastnameError = false;
    	        } else if (!/^[a-zA-Z]+$/.test(lastnameValue)) {
    	            $("#lastnamecheck").show();
    	            $("#lastnamecheck").html("**Only alphabets are accepted");
    	            lastNameError = false;
    	        } else if (lastnameValue.length < 3 || lastnameValue.length > 10) {
    	            $("#lastnamecheck").show();
    	            $("#lastnamecheck").html("**Length of lastname must be between 3 and 10");
    	            lastnameError = false;
    	        } else {
    	            $("#lastnamecheck").hide();
    	            lastnameError = true;
    	        }
    	    }
    	    
    	    $("#dateOfBirthCheck").hide();
    	    let dateOfBirthError = true;
    	    $("#birthdate").on("input", function() {
    	        validateDateOfBirth();
    	    });
    	    $("#submit").on("click", function(e) {
    	        validateDateOfBirth();
    	        if (!dateOfBirthError) {
    	            e.preventDefault();
    	        }
    	    });
    	    function validateDateOfBirth() {
    	        let dateOfBirthValue = $("#birthdate").val();
    	        if (dateOfBirthValue.trim().length === 0) {
    	            $("#dateOfBirthCheck").show();
    	            dateOfBirthError = false;
    	        } else {
    	            $("#dateOfBirthCheck").hide();
    	            dateOfBirthError = true;
    	        }
    	    }

    	    $("#Gendercheck").hide();
    	    let genderError = true;
    	    $("input[name='gender']").on("change", function() {
    	        validateGender();
    	    });
    	    $("#submit").on("click", function(e) {
    	        validateGender();
    	        if (!genderError) {
    	            e.preventDefault();
    	        }
    	    });
    	    function validateGender() {
    	        if (!$("input[name='gender']:checked").val()) {
    	            $("#Gendercheck").show();
    	            genderError = false;
    	        } else {
    	            $("#Gendercheck").hide();
    	            genderError = true;
    	        }
    	    }
    	    
    	    $("#emailcheck").hide();
    	    let emailError = true;
    	    $("#email").on("input", function() {
    	        validateEmail();
    	    });
    	    $("#submit").on("click", function(e) {
    	        validateEmail();
    	        if (!emailError) {
    	            e.preventDefault();
    	        }
    	    });
    	    function validateEmail() {
    	        let emailValue = $("#email").val();
    	        if (emailValue.trim().length === 0) {
    	            $("#emailcheck").show();
    	            emailError = false;
    	        } else if (!/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.(com|org|net|edu|gov|info|io))$/.test(emailValue)) {
    	            $("#emailcheck").show();
    	            $("#emailcheck").html("**Invalid email format");
    	            emailError = false;
    	        } else {
    	            $("#emailcheck").hide();
    	            emailError = true;
    	        }
    	    }

    	    $("#phonecheck").hide();
    	    let phoneError = true;
    	    $("#phone").on("input", function() {
    	        validateNumber();
    	    });
    	    $("#submit").on("click", function(e) {
    	        validateNumber();
    	        if (!phoneError) {
    	            e.preventDefault();
    	        }
    	    });
    	    function validateNumber() {
    	        let phoneValue = $("#phone").val();
    	        if (phoneValue.trim().length === 0) {
    	            $("#phonecheck").show();
    	            phoneError = false;
    	        } else if (!/^(0|91)?[6-9][0-9]{9}$/.test(phoneValue)) {
    	            $("#phonecheck").show();
    	            $("#phonecheck").html("**Invalid Number");
    	            phoneError = false;
    	        } else {
    	            $("#phonecheck").hide();
    	            phoneError = true;
    	        }
    	    }

    	    $("#passwordcheck").hide();
    	    let passwordError = true;
    	    $("#password").on("input", function() {
    	        validatePassword();
    	    });
    	    $("#submit").on("click", function(e) {
    	        validatePassword();
    	        if (!passwordError) {
    	            e.preventDefault();
    	        }
    	    });
    	    function validatePassword() {
    	        let passwordValue = $("#password").val();
    	        if (passwordValue.trim().length === 0) {
    	            $("#passwordcheck").show();
    	            passwordError = false;
    	        } else {
    	            $("#passwordcheck").hide();
    	            passwordError = true;
    	        }
    	    }

    	    $("#languagecheck").hide();
    	    let languageError = true;
    	    $("#multipleSelect").on("input", function() {
    	        validateLanguage();
    	    });
    	    $("#submit").on("click", function(e) {
    	        validateLanguage();
    	        if (!languageError) {
    	            e.preventDefault();
    	        }
    	    });
    	    function validateLanguage() {
    	        let languageValue = $("#multipleSelect").val();
    	        if (languageValue.length === 0 || languageValue === 'Select a language') {
    	            $("#languagecheck").show();
    	            languageError = false;
    	        } else {
    	            $("#languagecheck").hide();
    	            languageError = true;
    	        }
    	    } 
    	    $("#imagecheck").hide();
    	    let imageError = true;
    	    $("#image").on("change", function() {
    	        validateImage();
    	    });
    	    $("#submit").on("click", function(e) {
    	        validateImage();
    	        if (!imageError) {
    	            e.preventDefault();
    	        }
    	    });
    	    function validateImage() {
    	        let imageInput = $("#image")[0].files[0];
    	        if (!imageInput) {
    	            $("#imagecheck").show();
    	            imageError = false;
    	        } else {
    	            $("#imagecheck").hide();
    	            imageError = true;
    	        }
    	    }
    	    $("#hobbiesCheck").hide();
    	    $("#submit").on("click", function(e) {
    	        if ($(".hobby-checkbox:checked").length === 0) {
    	            $("#hobbiesCheck").show();
    	            e.preventDefault(); // Prevent form submission if no hobby is selected
    	        } else {
    	            $("#hobbiesCheck").hide();
    	        }
    	    });
    	    $("#countrycheck").hide();
    	    let countryError = true;
    	    $("#country").on("change", function() {
    	        validateCountry();
    	    });
    	    $("#submit").on("click", function(e) {
    	        validateCountry();
    	        if (!countryError) {
    	            e.preventDefault();
    	        }
    	    });
    	    function validateCountry() {
    	        let countryValue = $("#country").val();
    	        if (!countryValue || countryValue === "Select a Country") {
    	            $("#countrycheck").show();
    	            countryError = false;
    	        } else {
    	            $("#countrycheck").hide();
    	            countryError = true;
    	        }
    	    }
    	    $('#birthdate').on('change', function() {
                var selectedDate = new Date($(this).val());
                var currentDate = new Date();

                if (selectedDate > currentDate) {
                    alert('Please select valid date.');
                    $(this).val(''); 
                }
            });
            $('#birthdate').on('change', function() {
                var selectedDate = new Date($(this).val());
                var age = calculateAge(selectedDate);
                $('#age').val(age);
                if (age < 18) {
                    $('#child').prop('checked', true);
                } else {
                    $('#adult').prop('checked', true);
                }
            });
   		
            function calculateAge(birthdate) {
                var currentDate = new Date();
                var age = currentDate.getFullYear() - birthdate.getFullYear();
                if (currentDate.getMonth() < birthdate.getMonth() || (currentDate.getMonth() === birthdate.getMonth() && currentDate.getDate() < birthdate.getDate())) {
                    age--;
                }
                return age;
            }
      }); 
 	</script> 
</body>
</html>