function dropMenu(id) {
   var e = document.getElementById(id);
   if(e.style.display == 'block') {
      e.style.display = 'none';
   } else {
      e.style.display = 'block';
   }
}

function  formvalidation()
{
	var error = 0;
	if(!validateName('fname'))
	{
		document.getElementById('fnameError').style.display = "block";
		error++;
	}
	if(!validateName('lname'))
	{
		document.getElementById('lnameError').style.display = "block";
		error++;
	}
	
	if(!validateEmail(document.getElementById('email').value))
	{
		document.getElementById('emailerror').style.display = "block";
		error++;
	}
	if(!validateAddress(document.getElementById('add1').value))
	{
		document.getElementById('addressError').style.display = "block";
		error++;
	}
	if(!validateAddress1(document.getElementById('add2').value))
	{
		document.getElementById('address2Error').style.display = "block";
		error++;
	}
	if(!validateCity(document.getElementById('city').value))
	{
		document.getElementById('cityError').style.display = "none";
		error++;
	}
	if(!validateprovince(document.getElementById('province').value))
	{
		document.getElementById('provError').style.display = "none";
		error++;
	}
	if(error > 0)
	{
		return false;
	}
	
}
	function validateName(fname)
	{
	var re = /[A-Za-z - ']$/;
	if(re.test(fname))
	{
		document.getElementById('fname').style.background = '#ccffcc';
		document.getElementById('fnameError').style.display = "none";
		return true;
	}
	else
	{
		document.getElementById('fname').style.background = '#e35152';
		//document.getElementById(x + 'Error').style.display = "block"; 
		return false;
	}
	}
	function validateLname(lname)
	{
	var re = /[A-Za-z - ']$/;
	if(re.test(lname))
	{
		document.getElementById('lname').style.background = '#ccffcc';
		document.getElementById('lnameError').style.display = "none";
		return true;
	}
	else
	{
		document.getElementById('lname').style.background = '#e35152';
		//document.getElementById(x + 'Error').style.display = "block"; 
		return false;
	}
	}
	
	function validateEmail(email)
	{
		var re = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+.[a-zA-Z]{2,4}$/;
		if(re.test(email))
		{
			document.getElementById('email').style.background = '#ccffcc';
			document.getElementById('emailerror').style.display = "none";
			return true;
		}
		else
		{
			document.getElementById('email').style.background = '#e35152' ; 
			return false;
		}
			
	}
	function validateAddress(add1)
	{
	var re = /^[0-9a-zA-Z]+$/;
	if(re.test(add1))
	{
		document.getElementById('add1').style.background = '#ccffcc';
		document.getElementById('addressError').style.display = "none";
		return true;
	}
	else
	{
		document.getElementById('add1').style.background = '#e35152'; 
		return false;
	}
	}
	function validateAddress1(add2)
	{
	var re = /^[0-9a-zA-Z]+$/;
	if(re.test(add2))
	{
		document.getElementById('add2').style.background = '#ccffcc';
		document.getElementById('address2Error').style.display = "none";
		return true;
	}
	else
	{
		document.getElementById('add2').style.background = '#e35152'; 
		return false;
	}
	}
	function validateCity(city)
	{
	var re = /[A-Za-z - ']$/;
	if(re.test(city))
	{
		document.getElementById('city').style.background = '#ccffcc';
		document.getElementById('cityError').style.display = "none";
		return true;
	}
	else
	{
		document.getElementById('city').style.background = '#e35152';
		//document.getElementById(x + 'Error').style.display = "block"; 
		return false;
	}
	}
	function validateprov(province)
	{
	var re = /[A-Za-z - ']$/;
	if(re.test(province))
	{
		document.getElementById('province').style.background = '#ccffcc';
		document.getElementById('provError').style.display = "none";
		return true;
	}
	else
	{
		document.getElementById('provence').style.background = '#e35152';
		//document.getElementById(x + 'Error').style.display = "block"; 
		return false;
	}
	}
	
	/*function validatePass(register) // password & retype password verification
	{
		var i = document.getElementById('passworderror');
		i.innerHTML = '';
		var error =false;
		var invalid = '';
		minLength = 6;
		var pw1 = register.password.value;
		var pw2 = register.repassword.value;
		
		if(pw1 == ''|| pw2 == '')
		{
			error = 'Please enter your password';
			return false;
		}
		if(register.password.value.length < miniLength)
		{
			error = 'Your password must be at least' + miniLength + 'characters long. Try again.';
			return flase;
		}
		if(document.register.password.value.indexOf(invalid)> -1)
		{
			error = 'sorry space are not allowed.';
			return false;
		}
		else
		{
			if(pw1 != pw2)
			{
				error ='You did not enter the same new password twice. Please re-enter your password';
				return false;
			}
			else
			{
				error = 'Password match..';
				return true;
			}
			return false;
		}
	}*/

	/*var err={};
	var validemail =/^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+.[a-zA-Z]{2,4}$/;
	//validate email
	if(validemail.test(mail))
	{}
	else
	{
		err.message = "Invalid email";
		err.field = rregister.email;
	}
	if(err.message)
	{
		document.getElementById('divError').innerHTML = err.message;
		err.fild.focus();
		return false;
	}
	//check required fields
	//password should be minimum 4 char but not greater than 8
	if((str.length < 4) || (str.length > 8))
	{
		err.message="Invalid password length";
		err.field = register.password;
	}

	if(uaddress.value=="")
	{
		window.alert("Please enter address..");
		uaddress.focus();
		return false;
	}
	if(ucity.value=="")
	{
		window.alert("Please enter city..");
		ucity.focus();
		return false;
	}
	if(uprov.value=="")
	{
		window.alert("Please enter valid province..");
		uprov.focus();
		return false;
	}
	if(phone.value== "")
	{
		window.alert("Please enter your telephone number.");
		phone.focus();
		return false; 
	}
*/	


