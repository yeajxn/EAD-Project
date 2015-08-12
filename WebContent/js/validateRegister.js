function validateRegistration() {
	var name = document.getElementById("name").value;
	var email = document.getElementById("email").value;
	var password = document.getElementById("password").value;
	var contact = document.getElementById("contact").value;
	alert("test");
	var error = false;
	var errorMsg = "";
	var pattern = "";
	var result = true;
	/* 
	if (name == "") {
		error = true;
		errorMsg = "Please Enter Your Name";
	} else if (email == "") {
		error = true;
		errorMsg = "Please Enter Your Email";
	} else if (passwd == "") {
		error = true;
		errorMsg = "Please Enter Your Password";
	} else if (contact == "") {
		error = true;
		errorMsg = "Please enter your phone number";
	} else if (name.length > 50) {
		error = true;
		errorMsg = "Your Name is too long!";
	} else if (email.length > 100) {
		error = true;
		errorMsg = "Your Email is too long!";
	} else if (passwd.length > 25) {
		error = true;
		errorMsg = "Your password is too long!";
	} else if (contact.length != 8) {
		error = true;
		errorMsg = "Your phone number has to be 8 digits in length!";
	} else {
		pattern = /^[A-Za-z0-9._%+-]{1,}[@]{1}[A-Za-z0-9._%+-]{1,}$/i;
		result = pattern.test(email);
		if (result == false) {
			error = true;
			errorMsg = "Your email is invalid";
		}
		pattern = /^(.){1,25}$/i;
		result = pattern.test(passwd);
		if (result == false) {
			error = true;
			errorMsg = "Your password is invalid";
		}
		pattern = /^[-'A-Za-z\s]{1,50}$/i;
		result = pattern.test(name);
		if (result == false) {
			error = true;
			errorMsg = "Your name so weird";
		}
		pattern = /^[0-9]{8}$/i;
		result = pattern.test(contact);
		if (result == false) {
			error = true;
			errorMsg = "Your phone number is invalid";
		} 
	} 

	if (error){
		alert(errorMsg);
		return false;
	}
	else
		return true;*/
}