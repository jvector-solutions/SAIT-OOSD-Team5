// Function dropMenu() written by John
function dropMenu(id) {
   var e = document.getElementById(id);
   if(e.style.display == 'block') {
      e.style.display = 'none';
   } else {
      e.style.display = 'block';
   }
}

// Function formValidation() written by Megha
function  formvalidation() {
	var error = 0;
	if(!validateFname(document.getElementById('fname').value)) {
		document.getElementById('fnameError').style.display = "block";
		error++;
	} 
    if(!validateLname(document.getElementById('lname').value)) {
		document.getElementById('lnameError').style.display = "block";
		error++;
	}
    // Insert Password validation here
    
	if(!validateEmail(document.getElementById('email').value)) {
		document.getElementById('emailError').style.display = "block";
		error++;
	}
	if(!validateAddress(document.getElementById('add1').value)) {
		document.getElementById('addressError').style.display = "block";
		error++;
	}
	if(!validateCity(document.getElementById('city').value)) {
		document.getElementById('cityError').style.display = "block";
		error++;
	}
	if(!validateProv(document.getElementById('province').value)) {
		document.getElementById('provError').style.display = "block";
		error++;
	}
	if(!validatePostal(document.getElementById('postal').value)) {
		document.getElementById('postalError').style.display = "block";
		error++;
	}
	if(!validatePhone(document.getElementById('homephone').value)) {
		document.getElementById('homephoneError').style.display = "block";
		error++;
	}
    if(!validatePhone(document.getElementById('busphone').value)) {
		document.getElementById('busphoneError').style.display = "block";
		error++;
	}
	if(error > 0) {
		return false;
	}
	
}

// Function validateFname() written by Megha
function validateFname(fname) {
	var re = /[A-Za-z - ']$/;
	if(re.test(fname)) {
		document.getElementById('fname').style.background = '#ccffcc';
		document.getElementById('fnameError').style.display = "none";
		return true;
	} else {
		document.getElementById('fname').style.background = '#e35152';
		return false;
	}
}

// Function validateLname() written by Megha
function validateLname(lname) {
	var re = /[A-Za-z - ']$/;
	if(re.test(lname)) {
		document.getElementById('lname').style.background = '#ccffcc';
		document.getElementById('lnameError').style.display = "none";
		return true;
	} else {
		document.getElementById('lname').style.background = '#e35152'; 
		return false;
	}
}

// Function validateEmail() written by Megha
function validateEmail(email) {
    var re = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+.[a-zA-Z]{2,4}$/;
    if(re.test(email)) {
        document.getElementById('email').style.background = '#ccffcc';
        document.getElementById('emailError').style.display = "none";
        return true;
    } else {
        document.getElementById('email').style.background = '#e35152' ; 
        return false;
    }		
}

// Function validateAddress() written by Megha
function validateAddress(add1) {
	if(document.register.add1.value != "") {
		document.getElementById('add1').style.background = '#ccffcc';
		document.getElementById('addressError').style.display = "none";
		return true;
	} else {
		document.getElementById('add1').style.background = '#e35152'; 
        document.getElementById('add1').style.background = '#fff'; 
		return false;
	}
}

// Function validateCity() written by Megha
function validateCity(city) {
	var re = /[A-Za-z - ']$/;
	if(re.test(city)) {
		document.getElementById('city').style.background = '#ccffcc';
		document.getElementById('cityError').style.display = "none";
		return true;
	} else {
		document.getElementById('city').style.background = '#e35152'; 
		return false;
	}
}

// Function validateProv() written by Megha
function validateProv(province)	{
	var re = /^[?:AB|BC|MB|N[BLTSU]|ON|PE|QC|SK|YT]$/;
	if(re.test(province)) {
		document.getElementById('province').style.background = '#ccffcc';
		document.getElementById('provError').style.display = "none";
		return true;
	} else {
		document.getElementById('province').style.background = '#e35152';
		return false;
	}
}

// Function validatePostal() written by Megha
function validatePostal(postal)	{
    var re=/^([A-Z][0-9][A-Za-z] [0-9][A-Z][0-9])$/;
    if(re.test(postal)) {
        document.getElementById('postal').style.background ='#ccffcc';
        document.getElementById('postalError').style.background = "none";
        return true;
    } else {
        document.getElementById('postal').style.background = "#e35152";
        return false;
    }
}	

// Function validatePhone() written by Megha
function validatePhone(phone) {
    var re=/^[(]{0,1}[0-9]{3}[)]{0,1}[-\s\.]{0,1}[0-9]{3}[-\s\.]{0,1}[0-9]{4}$/;
    if(re.test(phone)) {
        document.getElementById('phone').style.background ='#ccffcc';
        document.getElementById('phoneError').style.background = "none";
        return true;
    } else {
        document.getElementById('phone').style.background = '#e35152';
        return false;
    }
}
