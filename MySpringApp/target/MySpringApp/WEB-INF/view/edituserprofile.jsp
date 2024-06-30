<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ page import="java.util.Base64" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Edit Profile</title>
	<link rel = "stylesheet" href = "https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css">
	<link rel = "stylesheet" href = "https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js">
	<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
	<script src = "https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
<form action="editprofile" method = "post"  enctype="multipart/form-data">
 <div class="container rounded bg-white mt-5 mb-5 d-flex justify-content-center align-items-center">
    <div class="row">
        <div class="col-md-3 border-top border-bottom"></div> 
        <div class="col-md-5 border-top border-bottom" custom-div>
            <div class="p-3 py-5">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <h4 class="text-right">Profile Settings</h4>
                </div>
                <div class="row mt-2">
                	<input type="hidden" name="id" value="${user.id}" />
                    <div class="col-md-6"><label class="labels">FirstName</label><input type="text" id = "firstname" name="firstname" class="form-control" placeholder="first name" value="${user.firstname}">
                    	<h6 style="color: red;" id="usercheck"> </h6>
                    </div>
                    <div class="col-md-6"><label class="labels">Lastname</label><input type="text" id= "lastname" name="lastname" class="form-control" value="${user.lastname}" placeholder="surname">
                    	<h6 style="color: red;" id="lastnamecheck"> </h6>
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col-md-12"><label class="labels">Date of birth</label><input type="date" id="birthdate" name="dateofbirth" class="form-control" value="<fmt:formatDate value="${user.dateofbirth}" pattern="yyyy-MM-dd" />">
                    	<h6 style="color: red;" id="dateOfBirthCheck"> </h6>
                    </div>
                    <div class="col-md-12"><label>Gender:</label>
			      		<input type="radio" name = "gender" id="Male" value="male" ${user.gender == 'male' ? 'checked': ''}>
			      	 	<label for="Male">Male</label>
			      		<input type="radio" id="Female" name="gender" value="female" ${user.gender == 'female' ? 'checked': ''}>
			         	<label for="Female">Female</label>
			         	<h6 style="color: red;" id="Gendercheck"> </h6>
			         	</div>
                    <div class="col-md-12"><label class="labels">Email</label><input type="text" id ="email" name="email" class="form-control" value="${user.getEmail()}">
                    	<h6 style="color: red;" id="emailcheck"> </h6>
                    </div>
                    <div class="col-md-12"><label class="labels">MobileNumber</label><input type="tel" id="phone" name="mobilenumber" class="form-control" value="${user.mobilenumber}">
                    	<h6 style="color: red;" id="phonecheck"> </h6>
                    </div>
                    <div class="col-md-12"><label class="labels">Password</label><input type=text name="password" id = "password" class="form-control" value="${user.password}">
                    	<h6 style="color: red;" id="passwordcheck"> </h6>
                    </div>
       				<div class="col-md-12">
					    <label class="labels">Languages: </label>
					    <select id="multipleSelect" multiple name="languages" class="form-control" data-search="true" data-silent-initial-value-set="true">					
					    <c:forEach var="language" items="${user.languages}"> 
					        <option value="English" <c:if test="${language eq 'English' }">selected</c:if>>English</option>
					        <option value="Hindi" <c:if test="${language eq 'Hindi'}">selected</c:if>>Hindi</option>
					        <option value="Gujarati" <c:if test="${language eq 'Gujarati'}">selected</c:if>>Gujarati</option>
					    </c:forEach>  
					    </select>
					    <h6 style="color: red;" id="languagecheck"> </h6>
					</div>
					<div class="col-md-12">
					    <label class="labels">Image</label>
					    <c:if test="${not empty user.imgdata}">
					        <img src="data:image/jpeg;base64,${Base64.getEncoder().encodeToString(user.imgdata)}"
					            style="max-width: 80px; max-height: 50px;">
					    </c:if>
					</div>
					<div class="col-md-12">
					    <label class="labels">Insert Image</label>
					    <input type="file" name="imagefile" id="image" class="form-control" accept="image/*">
					    <h6 style="color: red;" id="imagecheck"></h6>
					</div>

                    <div class="col-md-12"><label class="labels">Hobbies:</label>
				    	<div class="hobbies-options">Reading <input type="checkbox" id="hobbies" name="hobbies" value="Reading" 
                    		<c:forEach var="hobby" items="${user.hobbies}">
		                        <c:if test="${hobby == 'Reading'}">
		                            checked
		                        </c:if>
                    		</c:forEach>> Writing <input type="checkbox" id="hobbies" name="hobbies" value="Writing" 
		                    <c:forEach var="hobby" items="${user.hobbies}">
		                        <c:if test="${hobby == 'Writing'}">
		                            checked
		                        </c:if>
		                    </c:forEach>> Cricket <input type="checkbox" id="hobbies" name="hobbies" value="Cricket" 
		                    <c:forEach var="hobby" items="${user.hobbies}">
		                        <c:if test="${hobby == 'Cricket'}">
		                            checked
		                        </c:if>
		                    </c:forEach>>
						</div>
						<h6 style="color: red;" id="hobbiesCheck"> </h6>
				    </div>
				    <div class="col-md-12">
			        <label for="country" class = "labels">Country:</label>
			        <select id= "country" name = "country" placeholder="Select Country" >
			        	<option value="">Select Country</option>
    					<option value="${user.country}" selected>${user.country}</option>
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
               		<h6 style="color: red;" id="countrycheck"> </h6>
                </div>              
                <div class="mt-5 text-center"><button class="btn btn-primary profile-button" id="submit" type="submit">Save Profile</button></div>
            </div>
        </div>
    </div>
</div>
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

<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/js/bootstrap-select.min.js"></script>
<script type = "text/javascript">

$(document).ready(function() {
    $('#multipleSelect').select2();
});

$(document).ready(function () {	
	 let onlyAlphabets = /^[a-zA-Z]+$/;
     let usernameError = true;

     $("#firstname").on("input", function () {
       validateUsername();
     });
     
     $("#submit").on("click", function (e) {
       validateUsername();
       if (!usernameError) {
         e.preventDefault();
       }
     });
		
     function validateUsername() {
       let usernameValue = $("#firstname").val();
       if (usernameValue.trim().length === 0) {
         $("#usercheck").html("**Firstname is missing");
         usernameError = false;
       } else if (!onlyAlphabets.test(usernameValue)){
         $("#usercheck").html("**Only alphabets are accepted");
         userNameError = false;
       } else {
    	   $("#usercheck").html("");
         usernameError = true;
       }
     }
   });
$(document).ready(function () {
	let onlyAlphabets = /^[a-zA-Z]+$/;
    let lastnameError = true;

    $("#lastname").on("input", function () {
      validateLastname();
    });
    
    $("#submit").on("click", function (e) {
      validateLastname();
      if (!lastnameError) {
        e.preventDefault();
      }
    });
		
    function validateLastname() {
      let lastnameValue = $("#lastname").val();
      if (lastnameValue.trim().length === 0) {
        $("#lastnamecheck").html("**Lastname is missing");
        lastnameError = false;
      } else if (!onlyAlphabets.test(lastnameValue)){
	      $("#lastnamecheck").html("**Only alphabets are accepted");
	      lastNameError = false; 
      } else {
        $("#lastnamecheck").html("");
        lastnameError = true;
      }
    }    
  });
  
$(document).ready(function () {
    let dateOfBirthError = true;

    $("#birthdate").on("input", function () {
        validateDateOfBirth();
    });
    $('#birthdate').on('change', function() {
        var selectedDate = new Date($(this).val());
        var currentDate = new Date();

        if (selectedDate > currentDate) {
            alert('Please select valid date.');
            $(this).val(''); 
        }
    });
    $("#submit").on("click", function (e) {
        validateDateOfBirth();
        if (!dateOfBirthError) {
            e.preventDefault();
        }
    });
    
    function validateDateOfBirth() {
        let dateOfBirthValue = $("#birthdate").val();

        if (dateOfBirthValue.trim().length === 0) {
            $("#dateOfBirthCheck").html("**Date is missing");
            dateOfBirthError = false;
        } else {
        	$("#dateOfBirthCheck").html("");
            dateOfBirthError = true;
        }
    }
});
$(document).ready(function () {
    let genderError = true;

    $("input[name='gender']").on("change", function () {
        validateGender();
    });
    
    $("#submit").on("click", function (e) {
        validateGender();
        if (!genderError) {
            e.preventDefault();
        }
    });
    
    function validateGender() {
        if (!$("input[name='gender']:checked").val()) {
            $("#Gendercheck").html("**Select Gender");
            genderError = false;
        } else {
            $("#Gendercheck").html("");
            genderError = true;
        }
    }
});
$(document).ready(function () {
    let emailPattern = /^\w+([\.-]?\w+)@\w+([\.-]?\w+)(\.\w{2,3})+$/;

    $(document).on("input", "#email", function () {
        validateEmail();
    });

    $(document).on("click", "#submit", function (e) {
        if (!validateEmail()) {
            e.preventDefault(); 
        }
    });

    function validateEmail() {
        let emailValue = $("#email").val().trim();

        if (emailValue.length === 0) {
            $("#emailcheck").html("**Email is required");
            return false; 
        } else if (!emailPattern.test(emailValue)) {
            $("#emailcheck").show();
            $("#emailcheck").html("**Invalid email format");
            return false; 
        } else {
            $("#emailcheck").html("");
            return true; 
        }
    }
});
$(document).ready(function () {
	let phonePattern = /^(0|91)?[6-9][0-9]{9}$/;
    let phoneError = true;

    $("#phone").on("input", function () {
      validateNumber();
    });
    
    $("#submit").on("click", function (e) {
      validateNumber();
      if (!phoneError) {
        e.preventDefault();
      }
    });
		
    function validateNumber() {
        let phoneValue = $("#phone").val();

        if (phoneValue.trim().length ===0) {
        	$("#phonecheck").html("**PhoneNumber is missing");
        	phoneError = false;
        } else if (!phonePattern.test(phoneValue)) {
        	$("#phonecheck").show();
        	$("#phonecheck").html("**Invalid Number");
          phoneError = false;
        } else {
          	$("#phonecheck").html("");
          	phoneError = true;
        }
      }
  });
  
$(document).ready(function () {
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
  
$(document).ready(function () {
    $("#multipleSelect").on("change", function () {
        validateLanguage();
    });

    $(document).on("click", "#submit", function (e) {
        if (!validateLanguage()) {
            e.preventDefault();
        }
    });

    function validateLanguage() {
        let languageValue = $("#multipleSelect").val();
        if (languageValue === null || languageValue.length === 0) {
            $("#languagecheck").html("**Language is missing");
            return false;
        } else {
            $("#languagecheck").html("");
            return true;
        }
    }    

        $("input[name='hobbies']").on("change", function () {
            validateHobbies();
        });
        $(document).on("click", "#submit", function (e) {
            if (!validateHobbies()) {
                e.preventDefault();
            }
        });
        function validateHobbies() {

            if ($("input[name='hobbies']:checked").length === 0) {
                $("#hobbiesCheck").html("**Select atleast one hobby");
                return false;
            } else {
                $("#hobbiesCheck").html(""); 
                return true;
            }
        }
   
    $("#country").on("change", function() {
        validateCountry();
    });
    $(document).on("click", "#submit", function (e) {
        if (!validateCountry()) {
            e.preventDefault();
        }
    });
    function validateCountry() {
        let countryValue = $("#country").val();
        if (!countryValue || countryValue === "Select a Country") {
            $("#countrycheck").html("**Please select country");
            return false;
        } else {
            $("#countrycheck").html("");
            return true;
        }
    }
}); 


$(document).ready(function(){
    var $select = $('#multipleSelect');
    var uniqueValues = {};
    
    var preselectedOptions = [];
    $select.find('option:selected').each(function() {
        preselectedOptions.push($(this).attr('value'));
    });
    $select.find('option').each(function() {
        var value = $(this).attr('value');
        if(uniqueValues[value]){
            $(this).remove();
        } else {
            uniqueValues[value] = true;
        }
    });

    preselectedOptions.forEach(function(value) {
        $select.find('option[value="' + value + '"]').prop('selected', true);
    });
});
/*  $(document).ready(function(){
    $("#image").on("change", function() {
        validateImage();
    });
    $(document).on("click", "#submit", function (e) {
        if (!validateImage()) {
            e.preventDefault(); 
        }
    });
    function validateImage() {
        let imageInput = $("#image")[0].files[0];
        if (!imageInput) {
            $("#imagecheck").html("**Please select image");
            return false;
        } else {
            $("#imagecheck").html("");
            return true;
        }
    }
}); 
 */
window.addEventListener('DOMContentLoaded', function() {
    var languages= document.getElementById('languagesInput');
    var languagesarray = languages.value.split(/\s+/).filter(Boolean);
    var newlanguages = languagesarray.join(', '); 
    languages.value = newlanguages;
  });
  
window.addEventListener('DOMContentLoaded', function() {
    var languages= document.getElementById('languagesInput');
    var languagesarray = languages.value.split(/\s+/).filter(Boolean);
    var newlanguages = languagesarray.join(', '); 
    languages.value = newlanguages;
  });
</script>
</body>
</html>