<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="includes/DBconnect.jsp" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.regex.*"%> 

<%


	
int getId=Integer.parseInt(request.getParameter("id"));
int user_id = (Integer) session.getAttribute("user_id");
ResultSet rs1;
rs1 = st.executeQuery("SELECT * FROM `products` WHERE `product_id`="+getId);	  
 if(rs1.next()) { 
	 
	 
	    
	 
		  String errorMessage = "";
		  String statusMessage = "";
		  
          String product_no="";
		  String customer_name = "";
		  String Product_date="";
		  String mobile="";
		  String customer_address="";
		  
			  
		  if ("POST".equalsIgnoreCase(request.getMethod())) {
		  
		  product_no=request.getParameter("product_no");
		  customer_name=request.getParameter("customer_name").trim();
		  Product_date=request.getParameter("Product_date").trim();
		  mobile=request.getParameter("mobile").trim();
		  customer_address=request.getParameter("customer_address").trim();
		 
		  boolean isValid=true;
		  if(product_no == "") { isValid=false; errorMessage+="Please enter No Of Products<br>";}
		  if(Product_date=="") { isValid=false; errorMessage+="Please enter delivery date<br>";}
		  if(customer_name=="") { isValid=false; errorMessage+="Please enter name<br>";}

		  if(mobile=="") { isValid=false; errorMessage+="Please enter mobile number<br>";}
		  if(customer_address=="") { isValid=false; errorMessage+="Please enter Address<br>";}
		
		 
		 
if(isValid){
String sql;			
sql="INSERT INTO `buyproducts`(`buyproduct_name`, `buyproduct_price`, `buyproduct_no`, `buyproduct_date`, `customer_name`, `customer_mobile`, `customer_address`, `product_id`, `customer_id`,`product_type`) VALUES (?,?,?,?,?,?,?,?,?,?)";
//out.print(sql);

 PreparedStatement pstmt=con.prepareStatement(sql); 
          pstmt.setString(1,rs1.getString("product_name"));
		  pstmt.setString(2,rs1.getString("product_price"));
		  pstmt.setString(3,product_no);
		  pstmt.setString(4,Product_date);
		  pstmt.setString(5,customer_name);
		  pstmt.setString(6,mobile);
		  pstmt.setString(7,customer_address);
		  pstmt.setInt(8,getId);
		  pstmt.setInt(9,user_id);
		  pstmt.setString(10,"order");
		  
         pstmt.executeUpdate();
         statusMessage = "Purchase Successfully....!";
         
         response.sendRedirect("products_search.jsp");
		 
		 System.out.println("inserted");
			
		}
		   
	 }

%>





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
				<h1>Secure Mining of Association Rules in Horizontally Distributed Databases</h1>
				
			</div>
			
		</div>
	</div>
	<!-- End Header -->
	
  <%@ include file="cust_side_bar.jsp" %>
   
		<p id="pagehead">Order Products</p>
        
     	
			
	<h2 style="color:red">Expected to deliver within 1-5 days after your product is shipped</h2>
		
	
   <form class="form form-aligned" action="" method="post">
      <h3 style="color:#093; width:600px;"><%=statusMessage%></h3> 
                <h5 style="color:#F00; width:600px;"><%=errorMessage%></h5> 
    <fieldset>
    
    
        <div class="control-group">
       <label for="text"></label>
       <span> <img src="images/<%=rs1.getString("product_image_url")%>"></img></span>
        </div>
        <div class="control-group">
            <label for="name">Product Name</label>
            <strong><%=rs1.getString("product_name")%></strong>
        </div>
        <div class="control-group">
            <label for="name">Product Price</label>
            <strong><%=rs1.getString("product_price")%><span class="WebRupee">&#x20B9;</span></strong>
        </div>
<%
}
%>     <div class="control-group">
            <label for="name">No Of Order Products</label>
            <input id="product_name" name="product_no" type="text" />
        </div>
        <div class="control-group">
            <label for="name">Deliver Date</label>
            <input id="Product_date" name="Product_date" type="text" />
        </div>
        <div class="control-group">
            <label for="name">Customer Name</label>
            <input id="customer_name" name="customer_name" type="text" />
        </div>
        <div class="control-group">
            <label for="password">Mobile No</label>
            <input id="mobile"  name="mobile"type="text" />
        </div>
         <div class="control-group">
            <label for="email">Address</label>
            <textarea rows="5" name="customer_address"></textarea>
        </div>
       
        <div class="controls">
            <button type="submit" class="button button-primary">Buy Product</button>
        </div>
    </fieldset>
</form>

		<div >
       
        </div>
	</div>
	<!-- End Content -->
    
	</div>
    
<div style="clear: both;"></div>
<!-- Footer -->
<div id="footer">
	
</div>
<!-- End Footer -->

</body>
</html>