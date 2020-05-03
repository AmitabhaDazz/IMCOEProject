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
<% 
Map<String, List<SummaryTableDataSet>> collectionObject=(HashMap<String, List<SummaryTableDataSet>>)request.getSession().getAttribute("collectionObject");
String selectedClientName = request.getParameter("customerName");
List<SummaryTableDataSet> objectofOneClient = (List<SummaryTableDataSet>)collectionObject.get(selectedClientName);
%>

<body>
<p>&nbsp;</p>
<p>&nbsp;</p>
<table style="height: 281px;" border="1" width="597">
<tbody>
<tr>
<td style="width: 587px; text-align: center;">
<h2>Ingram Micro Azure Reserved Instances Recommendation Report</h2>
Buy Virtual Machine reserved instances to save money over pay-as-you-go costs.
<p>&nbsp;</p>
</td>
</tr>
</tbody>
</table>
<h1 style="text-align: center;"><%=selectedClientName %></h1>
<p style="text-align: center;">Recommendation Generated on Date</p>
<table style="height: 71px;" width="591">
<tbody>
<tr>
<td style="width: 581px;">
<p>Ingram Micro Azure Reserved Instances Recommendation Report</p>
<h2>1 Yrs Upfront Purchase recommendations(Compute Only)</h2>
</td>
</tr>
</tbody>
</table>
<p>&nbsp;</p>

<table border="1" colspan='1' style="height: 213px;" width="100%" class="w3-table-all">
<center>
<tbody>
<tr>
<td style="width: 581px;">
<table style="height: 81px;" width="572">
<tbody>
<tr>
<td style="width: 65px; text-align: center;">Subscription</td>
<td style="width: 65px; text-align: center;">Meter Name</td>
<td style="width: 65px; text-align: center;">Meter Region</td>
<td style="width: 65px; text-align: center;">Count of Meter name</td>
<td style="width: 65px; text-align: center;">PAYG_1Y</td>
<td style="width: 65px; text-align: center;">RI_1Y_PAYGPrice</td>
<td style="width: 65px; text-align: center;">1Y Savings</td>
<td style="width: 65px; text-align: center;">BreakEven</td>
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
</tbody>
</center>
</table>

</td>
</tr>
</tbody>
</table>
<p><strong>&nbsp;</strong></p>
<table style="height: 175px;" width="586">
<tbody>
<tr>
<td style="width: 576px;">
<table style="height: 56px;" width="565">
<tbody>
<tr>
<td style="width: 64px; text-align: center;">Resource Group</td>
<td style="width: 64px; text-align: center;">Instance ID</td>
<td style="width: 64px; text-align: center;">Unit Price PAYG</td>
<td style="width: 64px; text-align: center;">PAYG 1 Y</td>
<td style="width: 64px; text-align: center;">RI 1Y</td>
<td style="width: 64px; text-align: center;">Savings</td>
<td style="width: 64px; text-align: center;">Meter Name</td>
<td style="width: 65px;">&nbsp;</td>
</tr>
<tr>
<td style="width: 64px;">&nbsp;</td>
<td style="width: 64px;">&nbsp;</td>
<td style="width: 64px;">&nbsp;</td>
<td style="width: 64px;">&nbsp;</td>
<td style="width: 64px;">&nbsp;</td>
<td style="width: 64px;">&nbsp;</td>
<td style="width: 64px;">&nbsp;</td>
<td style="width: 65px;">&nbsp;</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</body>
</html>
