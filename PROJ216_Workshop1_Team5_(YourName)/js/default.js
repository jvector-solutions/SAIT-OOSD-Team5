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
    if (document.getElementById('fname').value != '') {
        if(re.test(fname)) {
            document.getElementById('fname').style.background = '#ccffcc';
            document.getElementById('fname').style.color = 'inherit';
            document.getElementById('fnameError').style.display = "none";
            return true;
        } else {
            document.getElementById('fname').style.background = '#e35152';
            document.getElementById('fname').style.color = '#fff';
            document.getElementById('fnameError').style.display = "block";
            return false;
        }
    }
}

// Function validateLname() written by Megha
function validateLname(lname) {
	var re = /[A-Za-z - ']$/;
    if (document.getElementById('lname').value != '') {
        if (re.test(lname)) {
            document.getElementById('lname').style.background = '#ccffcc';
            document.getElementById('lname').style.color = 'inherit';
            document.getElementById('lnameError').style.display = "none";
            return true;
        } else {
            document.getElementById('lname').style.background = '#e35152';
            document.getElementById('lname').style.color = '#fff';
            document.getElementById('lnameError').style.display = "block";
            return false;
        }
    }
}

// Function validateEmail() written by Megha
function validateEmail(email) {
    var re = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+.[a-zA-Z]{2,4}$/;
    if (document.getElementById('email').value != '') {
        if(re.test(email)) {
            document.getElementById('email').style.background = '#ccffcc';
            document.getElementById('email').style.color = 'inherit';
            document.getElementById('emailError').style.display = "none";
            return true;
        } else {
            document.getElementById('email').style.background = '#e35152'; 
            document.getElementById('email').style.color = '#fff';
            document.getElementById('emailError').style.display = "block";
            return false;
        }		
    }
}

// Function validatePassword1() written by Megha
function validatePassword1(password1) {
    var re = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z]{6,}$/;
    if (document.getElementById('password1').value != '') {
        if(re.test(password1)) {
            document.getElementById('password1').style.background = '#fff';
            document.getElementById('password1').style.color = 'inherit';
            document.getElementById('passwordError').style.color = 'inherit';
            return true;
        } else {
            document.getElementById('password1').focus();
            document.getElementById('password1').style.background = '#e35152'; 
            document.getElementById('password1').style.color = '#fff';
            document.getElementById('passwordError').style.color = '#e35152';
            return false;
        }		
    }
}

// Function validatePassword2() written by Megha
function validatePassword2(password2) {
    var re = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z]{6,}$/;
    if (document.getElementById('password2').value != '') {
        if(re.test(password2)) {
            document.getElementById('password2').style.background = '#fff';
            document.getElementById('password2').style.color = 'inherit';
            document.getElementById('passwordError').style.color = 'inherit';
            return true;
        } else {
            document.getElementById('password2').focus();
            document.getElementById('password2').style.background = '#e35152'; 
            document.getElementById('password2').style.color = '#fff';
            document.getElementById('passwordError').style.color = '#e35152';
            return false;
        }		
    }
}

// Function validatePassword2() written by Megha
function comparePasswords() {
    var p1 = document.getElementById('password1');
    var p2 = document.getElementById('password2');
    if (p1.value != '' && p2.value != '') {
        if( p1.value == p2.value) {
            p1.style.background = '#ccffcc';
            p2.style.background = '#ccffcc';
            return true;
        } else {
            p2.style.background = '#e35152';
            return false;
        }	
    }
}


// Function validateAddress() written by Megha
function validateAddress(add1) {
	if(document.register.add1.value != "") {
		document.getElementById('add1').style.background = '#ccffcc';
        document.getElementById('add1').style.color = 'inherit';
		document.getElementById('addressError').style.display = "none";
		return true;
	} else {
        document.getElementById('addressError').style.display = "block";
		return false;
	}
}

// Function validateCity() written by Megha
function validateCity(city) {
	var re = /[A-Za-z - ']$/;
    if (document.getElementById('city').value != '') {
        if(re.test(city)) {
            document.getElementById('city').style.background = '#ccffcc';
            document.getElementById('city').style.color = 'inherit';
            document.getElementById('cityError').style.display = "none";
            return true;
        } else {
            document.getElementById('city').style.background = '#e35152';
            document.getElementById('city').style.color = '#fff';
            document.getElementById('cityError').style.display = "block";
            return false;
        }
    }
}

// Function validateProv() written by Megha
function validateProv(province)	{
	var re = /^[?:AB|BC|MB|N[BLTSU]|ON|PE|QC|SK|YT]$/;
    if (document.getElementById('province').value != '') {
        if(re.test(province)) {
            document.getElementById('province').style.background = '#ccffcc';
            document.getElementById('province').style.color = 'inherit';
            document.getElementById('provError').style.display = "none";
            return true;
        } else {
            document.getElementById('province').style.background = '#e35152';
            document.getElementById('province').style.color = '#fff';
            document.getElementById('provError').style.display = "block";
            return false;
        }
    }
}

// Function validatePostal() written by Megha
function validatePostal(postal)	{
    var re=/^([A-Z][0-9][A-Za-z] [0-9][A-Z][0-9])$/;
    if (document.getElementById('postal').value != '') {
        if(re.test(postal)) {
            document.getElementById('postal').style.background ='#ccffcc';
            document.getElementById('postal').style.color ='inherit';
            document.getElementById('postalError').style.display = "none";
            return true;
        } else {
            document.getElementById('postal').style.background = "#e35152";
            document.getElementById('postal').style.color ='#fff';
            document.getElementById('postalError').style.display = "block";
            return false;
        }
    }
}	

// Function validatePhone() written by Megha
function validateHomePhone(phone) {
    var re=/^[(]{0,1}[0-9]{3}[)]{0,1}[-\s\.]{0,1}[0-9]{3}[-\s\.]{0,1}[0-9]{4}$/;
    if (document.getElementById('homephone').value != '') {
        if(re.test(phone)) {
            document.getElementById('homephone').style.background ='#ccffcc';
            document.getElementById('homephone').style.color ='inherit';
            document.getElementById('homephoneError').style.display = "none";
            return true;
        } else {
            document.getElementById('homephone').style.background = '#e35152';
            document.getElementById('homephone').style.color ='#fff';
            document.getElementById('homephoneError').style.display = "block";
            return false;
        }
    }
}

// Function validatePhone() written by Megha
function validateBusPhone(phone) {
    var re=/^[(]{0,1}[0-9]{3}[)]{0,1}[-\s\.]{0,1}[0-9]{3}[-\s\.]{0,1}[0-9]{4}$/;
    if (document.getElementById('busphone').value != '') {
        if(re.test(phone)) {
            document.getElementById('busphone').style.background ='#ccffcc';
            document.getElementById('busphone').style.color ='inherit';
            document.getElementById('busphoneError').style.display = "none";
            return true;
        } else {
            document.getElementById('busphone').style.background = '#e35152';
            document.getElementById('busphone').style.color ='#fff';
            document.getElementById('busphoneError').style.display = "block";
            return false;
        }
    }
}
