
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
	
   <%@ include file="cust_side_bar.jsp" %>
  
<% 
int user_id = (Integer) session.getAttribute("user_id");
int i=1;
ResultSet rs1;
rs1 = st.executeQuery("SELECT `ddate`,`buyproduct_name`,`order_report` FROM `buyproducts` WHERE  order_report !='NULL' AND `customer_id`="+user_id);	  
%>  

   
		<p id="pagehead">View All Products Details</p>

   <table class="table table-bordered" style="width:900px;">
    <thead>
        <tr>
            <th>S.No</th>
            <th>Product Name</th>
            <th>Product Order Status Report</th>
            <th>Delivery Date</th>
        </tr>
    </thead>

    <tbody>
       <%  while (rs1.next()) { %>	
        <tr>
            <td> <%=i++%></td>
            <td> <%=rs1.getString("buyproduct_name")%></td>
            <td> <%=rs1.getString("order_report")%></td>
            <td> <%=rs1.getString("ddate")%></td>
          </tr>
              
          <% }%>   
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












































