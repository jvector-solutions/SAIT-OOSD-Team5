<!-- forgot_pass.php page 
Author Name: Megha Patel
Creation Date: November 14th, 2014
Course: OOSD Fall 2014
Description: A php function where the user can change their password
//-->

<?php
    include("functions.php");
    session_start();

    $title = "Forgot Password";
    $display = "Login <i class='fa fa-angle-double-right'></i> Forgot Password";
    $slider = "02";
	$conn = mysqli_connect("localhost","root","","travelexperts") or die("MYSQL CONNECTION ERROR");	

    if(isset($_POST['submit'])) {
        $er="";
        $sql="select * from login where uname='$_POST[uname]' and sec_que='$_POST[sec_que]' and sec_ans='$_POST[sec_ans]'";
        $res=mysqli_query($sql);
        if($row=mysqli_fetch_array($res))
        {
            $er="Your Password is : ".$row['pass'];
        }
        else
        {
            $er="Invalid User";
        }
    } else {
        $er="";
    }
    mysqli_close($conn);
    include('header.php');
?>
    <div class='container-fluid'> <!-- Start of Container -->
            <!-- Main body begins here -->
            <div id='body'>
                <div class="row">
                    <div class="style col-xs-11 col-md-5 col-sm-6" style="float: none; margin: 0 auto;">
                    <!-- BEGIN Login Form //-->
                    <h1><i class="fa fa-question-circle"></i> Forgot Password</h1><hr class="style-one">
                    <?php
                        if (isset($er)) {
                            print("$er");	// It displays a message when the user does not put in their proper login information
                        }
                    ?>
                    <!-- this from access from user table -->
                    <form name="forgotpass" method="post" class="form-horizontal" role="form" >
                        <div class="form-group">
                            <label for="uname" class="col-sm-4 control-label">Email</label>
                            <div class="col-sm-8">
                                <input type="text" name="uname" class="form-control" id="uname" placeholder="Email Address">
                                <span id="loginemailError" style="display: none">You must enter your Email address.</span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="login_password" class="col-sm-4 control-label">Security Question</label>
                            <div class="col-sm-8">
                                <select name="sec_que" class="form-control">
                                   <option value="What is your favorite food?">What is your favorite food?</option>
                                   <option value="What is your favorite subject?">What is your favorite subject?</option>
                               </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="sec_ans" class="col-sm-4 control-label">Security Answer</label>
                            <div class="col-sm-8">
                                <input type="password" name="sec_ans" class="form-control" id="sec_ans" placeholder="Password">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-4 col-sm-8">
                                <button type="submit" class="btn btn-primary">Retrieve Password</button>
                            </div>
                        </div>
                    </form>
                    <!-- END Login Form //-->
                    </div>
                </div>
            </div> <!-- End of body -->
        </div> <!-- End of Container -->
        </div>
<?php
    include("footer.php");
?>
