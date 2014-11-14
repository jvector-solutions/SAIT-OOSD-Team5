<?php
include("conn.php");
?>
<?php
$er="";
if(isset($_POST['submit']))
{
	$er="";
	$sql="select * from login where uname='$_POST[uname]' and sec_que='$_POST[sec_que]' and sec_ans='$_POST[sec_ans]'";
	$res=mysql_query($sql);
	if($row=mysql_fetch_array($res))
	{
		$er="Your Password is : ".$row['pass'];
	}
	else
	{
		$er="Invalid User";
	}
}
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
</head>

<body>
<form method="post">
<table width="450" border="1" cellspacing="4" cellpadding="4">
<tr>
<th colspan="2"><?php echo $er; ?></th>
</tr>
  <tr>
    <th colspan="2">Forgot Password </th>
    </tr>
  <tr>
    <th>Username</th>
    <td><input type="text" name="uname" /></td>
  </tr>
  <tr>
    <th>Security Question</th>
    <td>
	<select name="sec_que">
	<option value="What is your favouraite food?">What is your favouraite food?</option>
	<option value="What is your favouraite subject?">What is your favouraite subject?</option>
	</select>
	</td>
  </tr>
  <tr>
    <th>Security Answer </th>
    <td><input type="text" name="sec_ans" /></td>
  </tr>
  <tr>
    <th>&nbsp;</th>
    <td><input type="submit" name="submit" value="Retrive" /></td>
  </tr>
</table>

</form>
</body>
</html>
