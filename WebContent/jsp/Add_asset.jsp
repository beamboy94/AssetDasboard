<%@include file="taglib_includes.jsp" %>
<html lang="en">

<head>
   <meta charset="utf-8" />
    <link rel="dashboard" sizes="76x76" href="img/dashboard.png" />
    <link rel="icon" type="image/png" href="img/dashboard.png" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>Asset Dashboard</title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />
    <!-- Bootstrap core CSS     -->
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <!--  Material Dashboard CSS    -->
    <link href="css/material-dashboard.css?v=1.2.0" rel="stylesheet" />
    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="css/demo.css" rel="stylesheet" />
    <!--     Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300|Material+Icons' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <script type="text/javascript" src="js/asset.js"></script>
</head>
<script type="text/javascript">


	function validation() {
		var name = document.getElementById('name').value;
		if(name == '') {
			document.getElementById('errNameId').style.display = 'block';
			return false;	
		}
		var name = document.getElementById('purchase_date').value;
		if(name == '') {
			document.getElementById('errdateId').style.display = 'block';
			return false;	
		}
		var name = document.getElementById('cost').value;
		if(name == '') {
			document.getElementById('errcostId').style.display = 'block';
			return false;	
		}
		
		return true;
	} 
	
</script>

<body>
    <div class="wrapper">
        <div class="sidebar" data-color="purple" data-image="img/sidebar-1.jpg" style :>
        
            <!--
        Tip 1: You can change the color of the sidebar using: data-color="purple | blue | green | orange | red"

        Tip 2: you can also add an image using data-image tag
    -->
             <div class="logo">
                <a class="simple-text">
                    Asset Explorer
                </a>
            </div>
            <div class="sidebar-wrapper">
                <ul class="nav">
                    <li>
                        <a href="viewIndex.do">
                            <i class="material-icons">dashboard</i>
                            <p>Dashboard</p>
                        </a>
                    </li>
                    <li>
                        <a href="Master_list.do">
                            <i class="material-icons">assignment</i>
                            <p>Master Asset List</p>
                        </a>
                    </li>
					<li>
						<li class="active">
                        <a href="Add_asset.do">
                            <i class="material-icons">note_add</i>
                            <p>Add an Asset</p>
                        </a>
                    </li>
                    
                    </ul>
            </div>
        </div>
        <div class="main-panel">
            <nav class="navbar navbar-transparent navbar-absolute">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="#"> Asset Dashboard </a>
                    </div>
                    <div class="collapse navbar-collapse">
                        <ul class="nav navbar-nav navbar-right">
                            
                            <li>
                                <a href="#pablo" class="dropdown-toggle" data-toggle="dropdown">
                                    <i class="material-icons">person</i>
                                    <p class="hidden-lg hidden-md">Profile</p>
                                </a>
                            </li>
                        </ul>
                        <form class="navbar-form navbar-right" role="search">
                            <div class="form-group  is-empty">
                                <input type="text" class="form-control" placeholder="Search">
                                <span class="material-input"></span>
                            </div>
                            <button type="submit" class="btn btn-white btn-round btn-just-icon">
                                <i class="material-icons">search</i>
                                <div class="clearfix"></div>
                            </button>
                        </form>
                    </div>
                </div>
            </nav>
		            <div class="content">
		                <div class="container-fluid">
		                    <div class="row">
		                        <div class="col-md-12">
		                            <div class="card">
		                                <div class="card-header" data-background-color="purple">
		                                    <h4 class="title">Add an Asset</h4>
		                                    <p class="category">Complete the details of new Asset</p>
		                                </div>
		                                <div class="card-content" >
		                                    <form:form  action="Add_asset.do" method="post" commandName="Add_asset">
		                                    
		                                        <div class="row">
		                                            
		                                               <div class="col-md-4">
		                                                <div class="form-group label-floating">
		                                                    <label class="control-label">Asset Name *</label><style="display: none;color: red;" >
		                                                    <form:input class="form-control" path="name" />
		                                                    <span id="errNameId" style="display: none;color: red;" >Please Enter The Name</span>                                                     
		                                                </div>
		                                            </div>
		                                            <div class="col-md-4">
		                                                <div class="form-group label-floating">
		                                                    <label class="control-label">Purchase Date *</label>
		                                                    <form:input type="name" class="datepicker form-control " path="purchase_date" />
		                                                    <span id="errdateId" style="display: none;color: red;" >Enter the Sate DD/MM/YYYY </span>
		                                                </div>
		                                                
		                                            </div>
		                                            <div class="col-md-4">
		                                                <div class="form-group label-floating is-empty">
		                                                    <label class="control-label">Asset Availability </label>
		                                                    <form:select class="form-control" path="asset_state">
		                                                    	<option disabled="" selected="">
							            						<form:option value="1" label="Available"/>
							            						<form:option value="0" label="Not Available"/>
							            					</form:select>
		                                                </div>
		                                            </div>
		                                            </div>
		                                          <div class="row">
		                                            <div class="col-md-4">
		                                                <div class="form-group label-floating">
		                                                    <label class="control-label">Vendor name</label>
		                                                    <form:input class="form-control" path="vendor_name"  /> 
		                                                </div>
		                                            </div>
		                                         
		                                            <div class="col-md-4">
		                                                <div class="form-group label-floating">
		                                                    <label class="control-label">Cost (in INR)</label>
		                                                    <form:input  type="number" class="form-control" path="cost"  /> 
		                                                    <span id="errcostId" style="display: none;color: red;" >Enter the Cost in INR </span>
		                                                </div>
		                                            </div>
		                                            
		                                        
		                                        
		                                        <div class="col-md-4">
		                                                <div class="form-group label-floating is-empty">
		                                                    <label class="control-label">Assigned User</label>
		                                                    <form:select class="form-control" path="assigned_user">
		                                                    	<option disabled="" selected="">
		                                                    	<form:option value="user1" label="User 1"/>
							            						<form:option value="user2" label="User 2"/>
							            					</form:select>
		                                                </div>
		                                            </div>
		                                        </div>
														<label class="text-danger">*Required</label>
														<br>
		                                        <input type="button" value="Back" class="btn btn-primary pull-left" onclick="javascript:go('Master_list.do');">
		                                        <input type="submit"  value="Save" class="btn btn-primary pull-right" onclick="return validation();"> 
		                                         <div class="clearfix"></div>
		                                         
												
		                                    </form:form>
		                                </div>
		                            </div>
		                        </div>
		                    </div>
		                            </div>
		                        </div>
		                        
		                    </div>
		                </div>
            
            <footer class="footer">
                <div class="container-fluid">
                       <p class="copyright pull-right">
                        &copy;
                        <script>
                            document.write(new Date().getFullYear())
                        </script>
                         </p>
                </div>
            </footer>
     
</body>
<!--   Core JS Files   -->
<script src="js/core/jquery.min.js"></script>
    <script src="js/core/popper.min.js"></script>
    <script src="js/bootstrap-material-design.js"></script>
    <!--  Plugin for Date Time Picker and Full Calendar Plugin  -->
    <script src="js/plugins/moment.min.js"></script>
    <!--	Plugin for the Datepicker, full documentation here: https://github.com/Eonasdan/bootstrap-datetimepicker -->
    <script src="js/plugins/bootstrap-datetimepicker.min.js"></script>
    <!--	Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
    <script src="js/plugins/nouislider.min.js"></script>
    <!-- Material Kit Core initialisations of plugins and Bootstrap Material Design Library -->
    <script src="js/material-kit.js?v=2.0.0"></script>
    <!-- Fixed Sidebar Nav - js With initialisations For Demo Purpose, Don't Include it in your project -->
    <script src="assets-for-demo/js/material-kit-demo.js"></script>
<script src="js/jquery-3.2.1.min.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<script src="js/material.min.js" type="text/javascript"></script>
<!--  Charts Plugin -->
<script src="js/chartist.min.js"></script>
<!--  Dynamic Elements plugin -->
<script src="js/arrive.min.js"></script>
<!--  PerfectScrollbar Library -->
<script src="js/perfect-scrollbar.jquery.min.js"></script>
<!--  Plugin for the DateTimePicker, full documentation here: https://eonasdan.github.io/bootstrap-datetimepicker/ -->
<script src="js/bootstrap-datetimepicker.min.js"></script>
<!--  Notifications Plugin    -->
<script src="js/bootstrap-notify.js"></script>
<!--  Google Maps Plugin    -->
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
<!-- Material Dashboard javascript methods -->
<script src="js/material-dashboard.js?v=1.2.0"></script>
<!-- Material Dashboard DEMO methods, don't include it in your project! -->
<script src="js/demo.js"></script>
<script src="../.js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript">
    $(document).ready(function() {

        // Javascript method's body can be found in assets/js/demos.js
        demo.initDashboardPageCharts();

    });
</script>
 <script>
        $(document).ready(function() {
            materialKitDemo.initFormExtendedDatetimepickers();
            // Sliders for demo purpose in refine cards section
            var slider = document.getElementById('sliderRegular');

            noUiSlider.create(slider, {
                start: 40,
                connect: [true, false],
                range: {
                    min: 0,
                    max: 100
                }
            });

            var slider2 = document.getElementById('sliderDouble');

            noUiSlider.create(slider2, {
                start: [20, 60],
                connect: true,
                range: {
                    min: 0,
                    max: 100
                }
            });
        });
    </script>

</html>