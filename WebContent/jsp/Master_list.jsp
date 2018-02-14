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
    <link href="img" />
    <!--     Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300|Material+Icons' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <script type="text/javascript" src="js/asset.js"></script>
    <script type="text/javascript" src="js"></script>
</head>

<body>
    <div class="wrapper">
       <div class="sidebar" data-color="purple" data-image="img/sidebar-3.jpg">
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
                    
					<li class="active">
                        <a href="Master_list.do">
                            <i class="material-icons">assignment</i>
                            <p>Master Asset List</p>
                        </a>
                    </li>
					<li>
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
                  <form action="searchContacts.do" method="post">		
			<table style="border-collapse: collapse;" border="0" bordercolor="#006699" width="500">
		<!-- 	<tr>
				<td>Enter Contact Name</td> 
				<td><input type="text" name="name"/>
					&nbsp;&nbsp;<input type="submit" value="Search"/>
					</td>
			</tr> -->
		</table>
	</form>
                    <div class="card">
                   <div class="card-header" data-background-color="purple">
                    
                                    <h4 class="title">Master Asset List</h4>
                                    <p class="category">Information of all assets stored here</p>
                                    </div>
                                <div class="card-content table-responsive">
             <form action="searchasset.do" method="post">	
             	
			<table style="border-collapse: collapse;" border="0" bordercolor="#006699" width="300">
			<tr>
			
			<div class="navbar-form navbar-right" role="search">
				<div class="form-group  is-empty">
				<td><input type="text" name="name" class="form-control" placeholder="Enter the Asset Name"/>
				<span class="material-input"></span></td><td>
				<button value="Search" class="btn btn-white btn-round btn-just-icon"/>
				<i class="material-icons">search</i><div class="ripple-container"></div></button></td>
				</div>
					</div>
					
					</tr>
					
					<!-- <div class="navbar-form navbar-left" role="search">
					
                            <div class="form-group  is-empty">
                                <input name="name" type="text" class="form-control" placeholder="Enter the Asset Name">
                                <span class="material-input"></span>
                            </div>
                            <button type="submit" value="Search" class="btn btn-white btn-round btn-just-icon">
                                <i class="material-icons">search</i>
                                <div class="ripple-container"></div>
                            </button>
                        </div>  -->   
                                      
					
			</td>
			</tr>
			</table>
			</form>             
			      
                                    <table class="table">
                                        <thead class="text-primary">
                                            <th>Asset Id</th>
                                            <th>Asset Name</th>
                                            <th>Asset State</th>
                                            <th>Cost</th>
                                            <th>Vendor Name</th>
                                            <th>Amendment</th>
                                        </thead>
         
         <c:if test="${empty SEARCH_ASSET_RESULTS_KEY}">
		<tr>
			<td colspan="4">No Results found</td>
		</tr>
		</c:if>
		<c:if test="${! empty SEARCH_ASSET_RESULTS_KEY}">
			<c:forEach var="asset" items="${SEARCH_ASSET_RESULTS_KEY}">	
			<tbody>	
		    <tr>
				<td><c:out value="${asset.id}"></c:out></td>
				<td><c:out value="${asset.name}"></c:out></td>
				<td><c:out value="${asset.asset_state}"></c:out> </td>
				<td><c:out value="${asset.cost}"></c:out></td>
				<td><c:out value="${asset.vendor_name}"></c:out></td>
				<%-- <td><c:out value="${asset.serial_num}"></c:out></td> --%>
				<td>&nbsp;
					<a href="editAsset.do?id=${asset.id}"><i rel="tooltip" title="Edit Asset" class="material-icons">edit</i></a>
					&nbsp;&nbsp;<a href="javascript:deleteAsset('deleteAsset.do?id=${asset.id}');"><i rel="tooltip" title="cancel" class="material-icons">cancel</i></a>
				</td>
			</tr>
			
			 </tbody>
			</c:forEach>
		</c:if>	 
                                       
                                    </table>
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
                        </a>Copyrights
                    </p>
                </div>
            </footer>
        
            
       </div>
    </div>
</body>
         
<!--   Core JS Files   -->
<script src="js/jquery-3.2.1.min.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<script src="js/material.min.js" type="text/javascript"></script>
<!--  Charts Plugin -->
<script src="js/chartist.min.js"></script>
<!--  Dynamic Elements plugin -->
<script src="js/arrive.min.js"></script>
<!--  PerfectScrollbar Library -->
<script src="js/perfect-scrollbar.jquery.min.js"></script>
<!--  Notifications Plugin    -->
<script src="js/bootstrap-notify.js"></script>
<!--  Google Maps Plugin    -->
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
<!-- Material Dashboard javascript methods -->
<script src="js/material-dashboard.js?v=1.2.0"></script>
<!-- Material Dashboard DEMO methods, don't include it in your project! -->
<script src="js/demo.js"></script>
<script type="text/javascript">
    $(document).ready(function() {

        // Javascript method's body can be found in assets/js/demos.js
        demo.initDashboardPageCharts();

    });
</script>

</html>