
<%@ include file="includes/DBconnect.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
<title>Admin Theme</title>
<link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
<link rel="stylesheet" href="css/custom.css" type="text/css" media="all" />
</head>
<body>

	<!-- Header -->
	<div id="header">
		<div class="shell">
			
			<div id="head">
				<h1><a href="#">Secure Mining of Association Rules in Horizontally Distributed Databases</a></h1>
			</div>
			
		</div>
	</div>
	<!-- End Header -->
	
   <%@ include file="admin_side_bar.jsp" %>
  
<% 
ResultSet rs1;
rs1 = st.executeQuery("SELECT * FROM `products`");	  
%>  

   
		<p id="pagehead">View All Products Details</p>

   <table class="table table-bordered" style="width:900px;">
    <thead>
        <tr>
            <th>Product Id</th>
            <th>Product Image</th>
            <th>Product Name</th>
            <th>Product Price</th>
            <th>Manufacture Date</th>
            <th>Product Expiry Date</th>
            <th>Product Edit</th>
            <th>Product Delete</th>
        </tr>
    </thead>

    <tbody>
       <%  
       
       
       if(!rs1.next()) { %>
       <tr><td colspan="9" align="center">No records found.</td></tr>

       	<%
       } else {
       do { %>	
        <tr>
            <td> <%=rs1.getString("product_id")%></td>
            <td>   <a href="images/<%=rs1.getString("product_image_url")%>" class="pirobox" title="<%=rs1.getString("product_name")%>"><img   src="images/<%=rs1.getString("product_image_url")%>" hieght="100" width="100"/></td>
            <td> <%=rs1.getString("product_name")%></td>
            <td> <span class="WebRupee">&#x20B9;</span> <%=rs1.getString("product_price")%></td>
            <td> <%=rs1.getString("product_mdate")%></td>
            <td> <%=rs1.getString("product_edate")%></td>
         
              
            <td> <a href="product_edit.jsp?id=<%=rs1.getString("product_id")%>"><strong class="button button-secondary" >  Edit</strong></strong></a></td>
            <td> <a href="product_delete.jsp?id=<%=rs1.getString("product_id")%>"><strong class="button button-error"> Delete</strong></a></td>
        </tr>
          <% }
       while (rs1.next()); }%>   
    </tbody>
    
</table>



		<div >
       
        </div>
	</div>
	<!-- End Content -->
    
	</div>
    
<div style="clear:both;"></div>
<!-- Footer -->
<div id="footer">
	
</div>
<!-- End Footer -->

</body>
</html>


<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/piroBox.1_2.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$().piroBox({
			my_speed: 600, //animation speed
			bg_alpha: 0.5, //background opacity
			radius: 4, //caption rounded corner
			scrollImage : false, // true == image follows the page, false == image remains in the same open position
			pirobox_next : 'piro_next', // Nav buttons -> piro_next == inside piroBox , piro_next_out == outside piroBox
			pirobox_prev : 'piro_prev',// Nav buttons -> piro_prev == inside piroBox , piro_prev_out == outside piroBox
			close_all : '.piro_close',// add class .piro_overlay(with comma)if you want overlay click close piroBox
			slideShow : 'slideshow', // just delete slideshow between '' if you don't want it.
			slideSpeed : 4 //slideshow duration in seconds(3 to 6 Recommended)
	});
});
</script>










