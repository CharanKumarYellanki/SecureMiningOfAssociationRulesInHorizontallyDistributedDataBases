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
	
	
    <div class="shell"> 
    <div id="sidebar">
    <ul>
    <li><a href="view_purchase.jsp">View Purchase Products</a></li>
    <li><a href="view_order.jsp">View Order Products</a></li>
	<li><a href="process_order.jsp">Process Order Products</a></li>
	<li><a href="logout.jsp">Log Out</a></li>
    </ul>
    </div>      
	<!-- Content -->
	<div id="content">	
	<p id="pagehead">Order Products</p>
  
<% 
ResultSet rs1;
rs1 = st.executeQuery("SELECT * FROM `products`");

String sql="SELECT customer_id,customer_address,customer_mobile,customer_name,p.product_image_url,product_price,product_name,buyproduct_id FROM `buyproducts` b LEFT JOIN products p ON p.product_id=b.product_id WHERE product_type='order' AND b.order_report is NULL ";

//out.print(sql);

ResultSet rs;
rs=st.executeQuery(sql);



%>  

            
     <div class="content">        
    <table class="table table-bordered" style="width:900px;">
    <thead>
        <tr>
            <th>Product</th>
            <th>Product Price</th>
            <th>Customer Name</th>
            <th>Customer Mobile</th>
            <th>Customer Address</th>
            <th>Order Report</th>
        </tr>
    </thead>
    <tbody>
     <%
     
     if(!rs.next()) { %>
     <tr><td colspan="5" align="center">No records found.</td></tr>

     	<%
     } else {
     do {

   %>  

             <tr>
            <td width="20%"><img src="images/<%=rs.getString("product_image_url")%>" width="100" height="100"></img> </td>
            <td width="10%"><span class="WebRupee">&#x20B9;<%=rs.getString("product_price")%></span></td>
            <td width="20%"><span> <%=rs.getString("customer_name")%></span></td> 
            <td width="20%"><span> <%=rs.getString("customer_mobile")%></span></td>      
            <td width="20%"><span> <%=rs.getString("customer_address")%></span></td>                
            <td> <a href="order_report.jsp?id=<%=rs.getString("customer_id")%>&&pid=<%=rs.getString("buyproduct_id")%>"><strong class="button button-secondary" >send report</strong></a></td>
            </tr>          
     
<%
} while (rs.next());
     }
%>

</tbody>
    
</table>
             </div>
            </div>


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













