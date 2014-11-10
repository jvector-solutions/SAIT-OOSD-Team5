function dropMenu(id) {
   var e = document.getElementById(id);
   if(e.style.display == 'block') {
      e.style.display = 'none';
   } else {
      e.style.display = 'block';
   }
}

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
	if(!validateAddress1(document.getElementById('add2').value)) {
		document.getElementById('address2Error').style.display = "block";
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
	if(!validatePhone(document.getElementById('phone').value)) {
		document.getElementById('phoneError').style.display = "block";
		error++;
	}
	if(error > 0) {
		return false;
	}
	
}
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
function validateAddress(add1) {
	var re = /^[0-9\sa-zA-Z] +$/;
	if(re.test(add1)) {
		document.getElementById('add1').style.background = '#ccffcc';
		document.getElementById('addressError').style.display = "none";
		return true;
	} else {
		document.getElementById('add1').style.background = '#e35152'; 
		return false;
	}
}
function validateAddress1(add2) {
	var re = /^[0-9a-zA-Z] +$/;
	if(re.test(add2)) {
		document.getElementById('add2').style.background = '#ccffcc';
		document.getElementById('address2Error').style.display = "none";
		return true;
	} else {
		document.getElementById('add2').style.background = '#e35152'; 
		return false;
	}
}
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
function validateProv(province)	{
	var re = /^[?:AB|BC|MB|N[BLTSU]|ON|PE|QC|SK|YT]$/;
	if(re.test(province)) {
		document.getElementById('province').style.background = '#ccffcc';
		document.getElementById('provError').style.display = "none";
		return true;
	} else {
		document.getElementById('province').style.background = '#e35152';
		//document.getElementById(x + 'Error').style.display = "block"; 
		return false;
	}
}
function validatePostal(postal)	{
    var re=/^([A-Z][0-9][A-Za-z] [0-9][A-Z][0-9])$/;
    if(re.test(postal)) {
        document.getElementById('postal').style.background ='#ccffcc';
        document.getElementById('postalError').style.background = "none";
    } else {
        document.getElementById('postal').style.background = "#e35152";
        return false;
    }
}	
function validatePhone(phone) {
    var re= /^([0-9]{3})[0-9]{3} - \d{4}/;
    if(re.test(phone)) {
        document.getElementById('phone').style.background ='#ccffcc';
        document.getElementById('phoneError').style.background = "none";
    } else {
        document.getElementById('phone').style.background = '#e35152';
        return false;
    }
}
/* 	
function validatePass(register) {
    var p1 = document.getElementById('password1Error');
    var p2 = document.getElementById('password2Error');

    var minLength=6;
    var invalid="";

    var pw1 = register.password1.value;
    var pw2 = register.password2.value;

    var error=false;
    p1.innerHtml='';
    p2.innerHtml='';


    if (pw1.length<1) {
        error='Please enter your password.';
    } else if (pw1.length < minLength) {
        error='Your password must be at least ' + minLength + ' characters long. Try again.';
    } else if (pw1.indexOf(invalid) > -1) {
        error='Sorry, spaces are not allowed.';
    } else if (pw2.length == 0) {
        error='Please retype password.';
        register.password2.focus();
        p2.innerHTML=error;
        return false;
    }
    if (error) {
        register.password.focus();
        p1.innerHTML=error;
        return false;
    }
    if (pw1 != pw2) {
        p2.innerHTML=' passwords not matching.Please re-enter your password.';
        register.password2.focus();
        return false;
    }
    return true;
}
*/
	
	
	
	


