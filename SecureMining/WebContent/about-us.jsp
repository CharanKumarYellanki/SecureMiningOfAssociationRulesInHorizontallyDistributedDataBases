<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="includes/DBconnect.jsp" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.regex.*"%> 





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
	
    <div class="shell"> 
           
       <%@ include file="side_bar.jsp" %>
    
	<!-- Content -->
	<div id="content">
   
		<p id="pagehead">About Us</p>
        
     	
We propose a protocol for secure mining of association rules in horizontally distributed databases. The current leading protocol is that of Kantarcioglu and Clifton [18]. Our protocol, like theirs, is based on the Fast Distributed Mining (FDM) algorithm of Cheung et al. [8], which is an unsecured distributed version of the Apriori algorithm. 

The main ingredients in our protocol are two novel secure multi-party algorithms --- one that computes the union of private subsets that each of the interacting players hold, and another that tests the inclusion of an element held by one player in a subset held by another. Our protocol offers enhanced privacy with respect to the protocol in [18]. In addition, it is simpler and is significantly more efficient in terms of communication rounds, communication cost and computational cost.
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