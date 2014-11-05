
function  formvalidation()
{
	var fn = document.register.fname.value;
	var ln = document.register.lname.value;
	var uemail = document.register.email.value;
	var upassword = document.register.password.value;
	var upass = document.register.repassword.value;
	var uaddress = document.register.add.value;
	var ucity = document.register.city.value;
	var uprov = document.register.province.value;
	var ucon = document.register.country.value;
	var upostal = document.register.postal.value;
	var uphone = document.register.phone.value;
		
	var err={};
	var validemail =/^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+.[a-zA-Z]{2,4}$/;

	//check required fields
	//password should be minimum 4 char but not greater than 8
	if((str.length < 4) || (str.length > 8))
	{
		err.message="Invalid password length";
		err.field = register.password;
	}

	//validate email
	if(validemail.test(mail))
	{
		
	}
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
	
	
	
}

