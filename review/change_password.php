<?php
	include('config.php');
?>
<html>
	<head>
    	<script language="javascript" type="text/javascript">		 
		function valid()
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
	$change_password=$_POST['change_password'];	
		
		$chk=mysql_query("SELECT * FROM login_table");
		
		$d=mysql_fetch_array($chk);
		if(($username==$d['admin_username'])&&($passsword==$d['admin_password']))
		{
			$update=mysql_query("UPDATE login_table SET admin_password='$change_password'");
			if(!$update)
			{
			echo "does not update";
			}
			else
			{
			echo "password to be change";
			}
		}
		else
		{
		echo "passwor not match";
		}
		
		
		/*$m=mysql_num_rows($chk);
		if($m>0) // this condition must write
		{
		echo "Successs";		
		}
		else
		{
		echo "Fail";
		}*/
	
	
	
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
    	<td>Change Password</td>
        <td><input type="text" name="change_password" id="change_password_id"></td>
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