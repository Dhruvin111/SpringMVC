<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ page import="java.util.Base64" %>
<html>
<head>
    <title>Edit Page</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
        crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
</head>
<body>

    <header>
        <nav class="navbar navbar-expand-md navbar-dark" style="background-color: blue">
        </nav>
    </header>
    <br>
    <div class="container col-md-5">
        <div class="card">
            <div class="card-body">
                <form action="edit" method="post" enctype="multipart/form-data">
                    <caption>
                        <h2>Edit User</h2>
                    </caption>
                     <input type="hidden" name="id" value="${user.id}" /> 
                     					
					<fieldset class="form-group">
                        <label>FirstName</label>
                        <input type="text" id = "firstname" value="${user.firstname}"class="form-control" name="firstname">
                        <h6 style="color: red;" id="usercheck">**Firstname is missing</h6>
                    </fieldset>
                    <fieldset class="form-group">
                        <label>LastName</label>
                        <input type="text" id= "lastname" value="${user.lastname}" class="form-control" name="lastname">
                        <h6 style="color: red;" id="lastnamecheck">**Lastname is missing</h6>
                    </fieldset>
					<fieldset class="form-group">
                        <label>Date of Birth</label>
                        <input type="date" value="${user.dateofbirth}" id="birthdate" class="form-control" name="dateofbirth">
                        <h6 style="color: red;" id="dateOfBirthCheck">**Date is missing</h6>
                    </fieldset>
                    <fieldset class="form-group">
                        <label>Gender</label>
                        <input type="radio" name = "gender" id="Male" name="gender" value="male" ${user.gender == 'male' ? 'checked': ''}>
			      	 	<label for="Male">Male</label>
			      		<input type="radio" id="Female" name="gender" value="female" ${user.gender == 'female' ? 'checked': ''}>
			         	<label for="Female">Female</label>
                    </fieldset>
                    <fieldset class="form-group">
                        <label>Email</label>
                        <input type="text" value="${user.email}" class="form-control" name="email" readonly>
                    </fieldset>
					<fieldset class="form-group">
                        <label>Mobile Number</label>
                        <input type="text" value="${user.mobilenumber}" class="form-control" name="mobilenumber" readonly>
                    </fieldset>
                    <fieldset class="form-group">
                        <label>Password</label>
                        <input type="password" value="${user.password}" class="form-control" name="password" readonly>
                    </fieldset>
                    <fieldset class="form-group">
                    	
                        <label>Languages</label>
                        <%-- <input type="text" readonly class="form-control" id="languagesInput" value=
							"<c:forEach items='${user.languages}' var='language'>${language} 
							</c:forEach>"> --%>
                         <select id="multipleSelect" multiple name="languages" class="form-control" data-search="true" data-silent-initial-value-set="true">
			<%-- 		        <option value="English" ${user.languages == 'English' ? 'selected': ''}>English</option>
         				    <option value="Hindi" ${user.languages == 'Hindi' ? 'selected': ''}>Hindi</option>
          					<option value="Gujarati" ${user.languages == 'Gujarati' ? 'selected': ''}>Gujarati</option> --%>
					    	<c:forEach var="language" items="${user.languages}"> 
					        <option value="English" <c:if test="${language eq 'English' }">selected</c:if>>English</option>
					        <option value="Hindi" <c:if test="${language eq 'Hindi'}">selected</c:if>>Hindi</option>
					        <option value="Gujarati" <c:if test="${language eq 'Gujarati'}">selected</c:if>>Gujarati</option>
					    </c:forEach>
					    </select> 
					    <h6 id="languagecheck">**Please select at least one language</h6>
                    </fieldset>
                    <fieldset class="form-group">
                    	<div><label class="labels">Image</label>                    	
        					<c:if test="${not empty user.imgdata}">
						    	<img src="data:image/jpeg;base64,${Base64.getEncoder().encodeToString(user.imgdata)}"
						            style="max-width: 80px; max-height: 50px;">
							</c:if>
    					</div>
                        <label>Insert Image</label>
                        <input type="file" name="image" id="image" class = "form-control" name="Image" accept="image/*" ">
                    </fieldset>
                    <fieldset class="form-group">
                        <label>Hobbies</label>
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
						<h6 id="hobbiesCheck">**Select atleast one hobby</h6>
                    </fieldset>
                    <fieldset class="form-group">
                        <label>Country:</label>
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
			        <h6 id="countrycheck">**Please select country</h6>
                    </fieldset>
                    <button type="submit" id = submit class="btn btn-success">Save</button>
                </form>
            </div>
        </div>
    </div>
</body>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

<script type = "text/javascript">
$(document).ready(function() {
    $('#multipleSelect').select2();
});
window.addEventListener('DOMContentLoaded', function() {
    var languages= document.getElementById('languagesInput');
    var languagesarray = languages.value.split(/\s+/).filter(Boolean);
    var newlanguages = languagesarray.join(', '); 
    languages.value = newlanguages;
  });
  
$(document).ready(function () {	
	 let onlyAlphabets = /^[a-zA-Z]+$/;
    $("#usercheck").hide();
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
        $("#usercheck").show();
        usernameError = false;
      } else if (!onlyAlphabets.test(usernameValue)){
        $("#usercheck").show();
        $("#usercheck").html("**Only alphabets are accepted");
        userNameError = false;
      } else {
        $("#usercheck").hide();
        usernameError = true;
      }
    }
  });
$(document).ready(function () {
	  let onlyAlphabets = /^[a-zA-Z]+$/;
   $("#lastnamecheck").hide();
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
       $("#lastnamecheck").show();
       lastnameError = false;
     } else if (!onlyAlphabets.test(lastnameValue)){
	      $("#lastnamecheck").show();
	      $("#lastnamecheck").html("**Only alphabets are accepted");
	      lastNameError = false; 
     } else {
       $("#lastnamecheck").hide();
       lastnameError = true;
     }
   }    
 });
 
$(document).ready(function () {
   $("#dateOfBirthCheck").hide();
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
           $("#dateOfBirthCheck").show();
           dateOfBirthError = false;
       } else {
           $("#dateOfBirthCheck").hide();
           dateOfBirthError = true;
       }
   }
});
$(document).ready(function () {
   $("#Gendercheck").hide();
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
           $("#Gendercheck").show();
           genderError = false;
       } else {
           $("#Gendercheck").hide();
           genderError = true;
       }
   }
});
$(document).ready(function () {
   $("#languagecheck").hide();

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
           $("#languagecheck").show();
           return false;
       } else {
           $("#languagecheck").hide();
           return true;
       }
   }
   
       $("#hobbiesCheck").hide();

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
               $("#hobbiesCheck").show(); 
               return false;
           } else {
               $("#hobbiesCheck").hide(); 
               return true;
           }
       }
   
   $("#countrycheck").hide();
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
           $("#countrycheck").show();
           return false;
       } else {
           $("#countrycheck").hide();
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
</script>
</html>
