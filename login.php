<?php
	include('config.php');
?>
<html>
	<head>
    	<script language="javascript" type="text/javascript">		 
		/*function valid()
		{
			var d=document.getElementById('username_id').value;
			var d1=document.getElementById('password_id').value;
			var res="";	
			var res_pos="";
			var res_pos1="";
			
			if(d.length==0)
			{
				res="Enter Username";
				document.getElementById('error1').innerHTML=res;
				res_pos=false;		
			}
			
			if(d.length>0)
			{
				res="";
				document.getElementById('error1').innerHTML=res;
				res_pos=true;				
			}	
					
			if(d1.length==0)
			{
				res="Enter Password";
				document.getElementById('error2').innerHTML=res;
				res_pos1=false;		
			}	
					
			if(d1.length>0)
			{
				res="";
				document.getElementById('error2').innerHTML=res;
				res_pos1=true;				
			}
			
			if(res_pos==false)
			{
			return false;
			}
			
			if(res_pos1==false)
			{
			return false;
			}
			
			return true;
		}*/
		</script>
    
    </head>
    <body>
    <?php
	if(isset($_POST['submit']))
	{
	$username=$_POST['username'];
	//echo $username; //clear it
	$passsword=$_POST['password'];
	//echo $passsword; //clear it
	$confirm_password=$_POST['confirm_password'];	
		
	
		if($passsword==$confirm_password)
		{
			echo "pass and conpss same";
		}
		else
		{
		echo "pass and conpss not same";
		}
		
	}
	?>
    <form method="post" action="<?php $_SERVER['PHP_SELF']; ?>" 
    onSubmit="return valid();"> 
    <!-- to call same page --> 
    <table border="1" align="center">
    
    <tr>
    	<td width="100">Username</td>
        <td width="120"><input type="text" name="username" id="username_id"></td>
        <td width="200"><div id="error1"></div></td>
    </tr>
    <tr>
    	<td>Password</td>
        <td><input type="text" name="password" id="password_id"></td>
        <td><div id="error2"></div></td>
    </tr>
    <tr>
    	<td>Confirm Password</td>
        <td><input type="text" name="confirm_password" id="confirm_password_id"></td>
        <td><div id="error3"></div></td>
    </tr>
    
    <tr>
    	<td></td>
        <td><input type="submit" name="submit" value="SUBMIT"></td>
        <td><div id="error2"></div></td>
    </tr>
    
    </table>
    </form>
    </body>
</html>