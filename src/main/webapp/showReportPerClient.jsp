<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>


<%@ page import="com.imco.costoptimization.app.SummaryTableDataSet" %>
<!DOCTYPE html>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<% 
Map<String, List<SummaryTableDataSet>> collectionObject=(HashMap<String, List<SummaryTableDataSet>>)request.getSession().getAttribute("collectionObject");
String selectedClientName = request.getParameter("customerName");
List<SummaryTableDataSet> objectofOneClient = (List<SummaryTableDataSet>)collectionObject.get(selectedClientName);

out.println(selectedClientName);


%>
<table class="w3-table-all">
    <tr>
      <th>Subscription</th>
      <th>Meter Name</th>
      <th>Meter Region</th>
      <th>Count of Meter Name</th>
      <th>PAYG 1 Year</th>
      <th>RI PAYG 1 Year</th>
      <th>Savings 1 Year</th>
      <th>BreakEvenMonth</th>
    </tr>
	
<%
	for (SummaryTableDataSet eachObject : objectofOneClient) {
		out.println("<tr>");
    	out.println("<td>"+eachObject.getSubscription()+"</td>");
    	out.println("<td>"+eachObject.getMeterName()+"</td>");
    	out.println("<td>"+eachObject.getMeterRegion()+"</td>");
    	out.println("<td>1</td>");
    	out.println("<td>"+eachObject.getPayG_1y()+"</td>");
    	out.println("<td>"+eachObject.getRi_1Y_PAYGPrice()+"</td>");
    	out.println("<td>"+eachObject.getRi_1Y_Savings_PAYG()+"</td>");
    	out.println("<td>7</td>");
    	out.println("</tr>");
 	}
%>  
	
	  
</table>
</body>
</html>
