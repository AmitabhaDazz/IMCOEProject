<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import = "java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import = "java.util.stream.Stream " %>
<%
         Date date = new Date();
         Double payg1y_total=0.0,payg3y_total=0.0;
         Double ripayg1y_total=0.0, ripayg3y_total=0.0;
         Double ri1ysaving_total=0.0;
         Double x=222.0,avg=0.0,count=0.0,count2=0.0;
         Double payg1y=0.0, ri1ypayg=0.0, ri1ysaving=0.0;
         Double ri3ysaving_total=0.0,unitPlace3y=0.0;
         Double avg3y=0.0,unitPlace1y=0.0,sumbreak3y=0.0,break3y=0.0,payg3y=0.0,ri3ypayg=0.0,ri3ysaving=0.0;
      	int count3y=0;
      %>

<%@ page import="com.imco.costoptimization.app.SummaryTableDataSet" %>
<!DOCTYPE html>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ingram Micro</title>
<style type="text/css">
#customers {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}
#customers td, #customers th {
  border: 1px solid #ddd;
  padding: 8px;
}
#customers tr:nth-child(even){background-color: #f2f2f2;}
#customers th {
-webkit-print-color-adjust: exact;
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #000000 ;
  color: white;
}

</style>
</head>
<% 
Map<String, List<SummaryTableDataSet>> collectionObject=(HashMap<String, List<SummaryTableDataSet>>)request.getSession().getAttribute("collectionObject");
String selectedClientName = request.getParameter("customerName");
List<SummaryTableDataSet> objectofOneClient = (List<SummaryTableDataSet>)collectionObject.get(selectedClientName);
List<SummaryTableDataSet> objectofOneClient_temp = (List<SummaryTableDataSet>)collectionObject.get(selectedClientName);
%>

<body>
<p>&nbsp;</p>
<p>&nbsp;</p>
<center>
<table style="background-color:#e6f2ff; height: 281px;" border="1;" width="597px;" >
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
</center>
<h1 style="text-align: center;"><%=selectedClientName %></h1>
<p style="text-align: center;">Recommendation Generated on <%out.print(date.toString()); %></p>
<table style="height: 71px;" width="591">
<tbody>
<tr>
<br>
<td  >
<p class="ridge">Ingram Micro Azure Reserved Instances Recommendation Report<br>
1 Yrs Upfront Purchase recommendations(Compute Only)</p>
</td>
</tr>
</tbody>
</table>
<p>&nbsp;</p>

<table border="1" colspan='1' id="customers">
<center>
<tbody>
<tr>
<td style="width: 581px;">
<table style="height: 60px;" width="572" id="customers">
<tbody>
<tr>
<th style="width: 65px; text-align: center;">Subscription</th>
<th style="width: 65px; text-align: center;">Meter Name</th>
<th style="width: 65px; text-align: center;">Meter Region</th>
<th style="width: 90px; text-align: center;">Count of Meter Name</th>
<th style="width: 65px; text-align: center;">PAYG_1Y</th>
<th style="width: 65px; text-align: center;">RI_1Y_PAYGPrice</th>
<th style="width: 65px; text-align: center;">1Y Savings</th>
<th style="width: 65px; text-align: center;">BreakEven</th>
</tr>
<%

//unique meter name
	int count1y=0,j1=0;
	double payg1=0.0,paygri1=0.0,savingspayg1=0.0, breakevn=0.0;
	ArrayList<String> travesedmetername = new ArrayList<String>();
	String sub="", mn="", mr="";
	int cn;
	int place=0,totalmeter=0;
	int[] countcontainer = new int[20];
	int cnf=1,x1=1;
	String tempmetername;
	for (SummaryTableDataSet eachObject1 : objectofOneClient) {
		if(j1==0){
			travesedmetername.add(eachObject1.getMeterName());
			
			countcontainer[place]=cnf;
			j1++;
		}
		else{
			
				tempmetername=eachObject1.getMeterName();
				if(travesedmetername.contains(tempmetername)){
					cnf++;
					countcontainer[place]=cnf;
				}else{
					travesedmetername.add(tempmetername);
					x1++;
					j1++;
					place++;
					countcontainer[place]=1;
				}
				
			
			
		}
		cnf=1;
	}
	for(int i=0;i<travesedmetername.size();i++){
		for (SummaryTableDataSet eo : objectofOneClient) {
			if(travesedmetername.get(i).equals(eo.getMeterName())){
				savingspayg1=savingspayg1+eo.getRi_1Y_Savings_PAYG();
				payg1=payg1+eo.getPayG_1y();
				paygri1=paygri1+eo.getRi_1Y_PAYGPrice();
				sub=eo.getSubscription();
				mn=eo.getMeterName();
				mr=eo.getMeterRegion();
			}
		}
		//System.out.println(countcontainer[i]);
		totalmeter=totalmeter+countcontainer[i];
		out.println("<tr>");
    	out.println("<td>"+sub+"</td>");
    	out.println("<td>"+mn+"</td>");
    	out.println("<td>"+mr+"</td>");
    	out.println("<td>"+countcontainer[i]+"</td>");
    	out.println("<td>"+Math.round(payg1*100.0)/100.0+"</td>");
    	out.println("<td>"+Math.round(paygri1 * 100.0) / 100.0+"</td>");
    	out.println("<td>"+Math.round(savingspayg1 * 100.0) / 100.0+"</td>");
    	out.println("<td>"+Math.round(paygri1/payg1*12*100.0)/100.0+"</td>");
    	out.println("</tr>");
    	payg1=0.0;
		paygri1=0.0;
		savingspayg1=0.0;
	}
	//end


	for (SummaryTableDataSet eachObject : objectofOneClient) {
		
		String meter_name = eachObject.getMeterName();
		int count_i=0,j=0;
		String meternm="";
		String[] mtr={};
		for (SummaryTableDataSet eachObject1 : objectofOneClient) {
			if(meter_name.equals(eachObject1.getMeterName())){
				count_i++;
				meternm=eachObject1.getMeterName();
				if(count_i>1){
					mtr[j]=meternm;
					j++;
				}
			}
			
			count_i=0;
			
		}
		for(int k=0; k<mtr.length;k++){
			out.println(mtr[j]);
		}
		payg1y_total=payg1y_total+eachObject.getPayG_1y();
		ripayg1y_total=ripayg1y_total+eachObject.getRi_1Y_PAYGPrice();
		ri1ysaving_total=ri1ysaving_total+eachObject.getRi_1Y_Savings_PAYG();
		avg=avg+(eachObject.getRi_1Y_PAYGPrice()/eachObject.getPayG_1y()*12);
		count++;
		
		/* out.println("<tr>");
    	out.println("<td>"+eachObject.getSubscription()+"</td>");
    	out.println("<td>"+eachObject.getMeterName()+"</td>");
    	out.println("<td>"+eachObject.getMeterRegion()+"</td>");
    	//out.println("<td>"+5+"</td>");
    	out.println("<td>"+Math.round(eachObject.getPayG_1y()*100.0)/100.0+"</td>");
    	out.println("<td>"+Math.round(eachObject.getRi_1Y_PAYGPrice() * 100.0) / 100.0+"</td>");
    	out.println("<td>"+Math.round(eachObject.getRi_1Y_Savings_PAYG() * 100.0) / 100.0+"</td>");
    	out.println("<td>"+Math.round(eachObject.getRi_1Y_PAYGPrice()/eachObject.getPayG_1y()*12*100.0)/100.0+"</td>");
    	out.println("</tr>"); */
    	
 	} 
	avg=avg/count;
	avg=Math.round(avg*100.0)/100.0;
	count=0.0;
	payg1y_total=Math.round(payg1y_total*100.0)/100.0;
	ripayg1y_total=Math.round(ripayg1y_total*100.0)/100.0;
	ri1ysaving_total=Math.round(ri1ysaving_total*100.0)/100.0;
%> 
<tr>
<th style="width: 65px; text-align: center;">Total</th>
<td style="width: 65px; text-align: center;"></td>
<td style="width: 65px; text-align: center;"></td>
<td style="width: 65px; "><b><% out.println(totalmeter); %></b></td>
<td style="width: 65px; "><b><% out.println(payg1y_total); %></b></td>
<td style="width: 65px; "><b><% out.println(ripayg1y_total); %></b></td>
<td style="width: 65px; "><b><% out.println(ri1ysaving_total); %></b></td>
<td style="width: 65px; "><b><%out.println(avg); %></b></td>
</tr> 
</tbody>
</center>
</table>

</td>
</tr>
</tbody>
</table>
<p><strong>&nbsp;</strong></p>
<table id="customers">
<tbody>
<tr>
<td style="width: 576px;">
<table style="height: 40px;" >
<tbody>
<tr>
<th style="width: 64px; text-align: center;">Resource Group</th>
<th style="width: 64px; text-align: center;">Instance ID</th>
<th style="width: 75px; text-align: center;">Unit Price PAYG</th>
<th style="width: 64px; text-align: center;">PAYG 1 Y</th>
<th style="width: 64px; text-align: center;">RI 1Y</th>
<th style="width: 64px; text-align: center;">Savings</th>
<th style="width: 64px; text-align: center;">Meter Name</th>
</tr>
<%
	for (SummaryTableDataSet eachObject : objectofOneClient) {
		count2++;
		out.println("<tr>");
    	out.println("<td>"+eachObject.getResourceGroup()+"</td>");
    	out.println("<td>"+eachObject.getInstanceId()+"</td>");
    	out.println("<td>"+Math.round(eachObject.getUnitPrice_PAYG()*100.0)/100.0+"</td>");
    	out.println("<td>"+Math.round(eachObject.getPayG_1y()*100.0)/100.0+"</td>");
    	out.println("<td>"+Math.round(eachObject.getRi_1Y_PAYGPrice()*100.0)/100.0+"</td>");
    	out.println("<td>"+Math.round((eachObject.getPayG_1y()-eachObject.getRi_1Y_PAYGPrice()) * 100.0) / 100.0+"</td>");
    	out.println("<td>"+eachObject.getMeterName()+"</td>");
    	out.println("</tr>");
    	payg1y=payg1y+eachObject.getPayG_1y();
    	ri1ypayg=ri1ypayg+eachObject.getRi_1Y_PAYGPrice();
    	ri1ysaving=ri1ysaving+(eachObject.getPayG_1y()-eachObject.getRi_1Y_PAYGPrice());
    	unitPlace1y=unitPlace1y+eachObject.getUnitPrice_PAYG();
	}
	
%> 
<tr>
<th style="width: 64px;"><b>Total</b></th>
<td style="width: 64px;">&nbsp;</td>
<td style="width: 64px;"><b><%out.println(Math.round(unitPlace1y*100.0)/100.0); %></b></td>
<td style="width: 64px;"><b><%out.println(Math.round(payg1y*100.0)/100.0); %></b></td>
<td style="width: 64px;"><b><%out.println(Math.round(ri1ypayg*100.0)/100.0); %></b></td>
<td style="width: 64px;"><b><% out.println(Math.round(ri1ysaving*100.0)/100.0); %></b></td>
<td style="width: 65px;">&nbsp;</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
<table style="height: 50px;" width="591">
<tbody>
<tr>
<td style="width: 581px;">
<p>Ingram Micro Azure Reserved Instances Recommendation Report</p>
<h2>3 Yrs Upfront Purchase recommendations(Compute Only)</h2>
</td>
</tr>
</tbody>
</table>
<p>&nbsp;</p>



<table border="1" colspan='1' style="height: 213px;" width="100%" class="w3-table-all" id="customers">
<center>
<tbody>
<tr>
<td style="width: 581px;">
<table id="customers">
<tbody>
<tr>
<th style="width: 65px; text-align: center;">Subscription</th>
<th style="width: 65px; text-align: center;">Meter Name</th>
<th style="width: 65px; text-align: center;">Meter Region</th>
<th style="width: 90px; text-align: center;">Count of Meter Name</th>
<th style="width: 65px; text-align: center;">PAYG_3Y</th>
<th style="width: 65px; text-align: center;">RI_3Y_PAYGPrice</th>
<th style="width: 65px; text-align: center;">RI_3Y_Saving_PAYGPrice</th>
<th style="width: 65px; text-align: center;">BreakEven_Month_3Y</th>
</tr>
<%


//unique meter name
	int count3ys=0,j2y=0;
	double payg3=0.0,paygri3=0.0,savingspayg3=0.0, breakevn3y=0.0;
	//ArrayList<String> travesedmetername3y = new ArrayList<String>();
	String sub3y="", mn3y="", mr3y="";
	int cn3y;
	
	String tempmetername3y;
	
	for(int i=0;i<travesedmetername.size();i++){
		for (SummaryTableDataSet eo : objectofOneClient) {
			if(travesedmetername.get(i).equals(eo.getMeterName())){
				savingspayg3=savingspayg3+eo.getRI_3Y_Savings_PAYG();
				payg3=payg3+eo.getPAYG_3Y();
				paygri3=paygri3+eo.getRI_3Y_PAYGPrice();
				sub=eo.getSubscription();
				mn=eo.getMeterName();
				mr=eo.getMeterRegion();
			}
		}
		//System.out.println(travesedmetername.get(i)+"payg\t"+payg1+"paygri1\t"+paygri1);
		
		out.println("<tr>");
  	out.println("<td>"+sub+"</td>");
  	out.println("<td>"+mn+"</td>");
  	out.println("<td>"+mr+"</td>");
  	out.println("<td>"+countcontainer[i]+"</td>");
  	out.println("<td>"+Math.round(payg3*100.0)/100.0+"</td>");
  	out.println("<td>"+Math.round(paygri3 * 100.0) / 100.0+"</td>");
  	out.println("<td>"+Math.round(savingspayg3 * 100.0) / 100.0+"</td>");
  	out.println("<td>"+Math.round(paygri3/payg3*36*100.0)/100.0+"</td>");
  	out.println("</tr>");
  	payg3=0.0;
  	paygri3=0.0;
  	savingspayg3=0.0;
	}
	//end









	for (SummaryTableDataSet eachObject : objectofOneClient) {
		
		payg3y_total=payg3y_total+eachObject.getPAYG_3Y();
		ripayg3y_total=ripayg3y_total+eachObject.getRI_3Y_PAYGPrice();
		ri3ysaving_total=ri3ysaving_total+eachObject.getRI_3Y_Savings_PAYG();
		avg3y=avg3y+(eachObject.getRI_3Y_PAYGPrice()/eachObject.getPAYG_3Y()*12);
		count3y++;
		 /* out.println("<tr>");
    	out.println("<td>"+eachObject.getSubscription()+"</td>");
    	out.println("<td>"+eachObject.getMeterName()+"</td>");
    	out.println("<td>"+eachObject.getMeterRegion()+"</td>");
    	out.println("<td>test</td>"); */
    	
    	//out.println("<td>"+Math.round(eachObject.getPAYG_3Y()* 100.0) / 100.0+"</td>");
    	//out.println("<td>"+Math.round(eachObject.getRI_3Y_PAYGPrice() * 100.0) / 100.0+"</td>");
    //	out.println("<td>"+Math.round(eachObject.getRI_3Y_Savings_PAYG() * 100.0) / 100.0+"</td>");
    	break3y=Math.round(eachObject.getRI_3Y_PAYGPrice()/eachObject.getPAYG_3Y()*36*100.0)/100.0;
    	sumbreak3y=sumbreak3y+break3y;
    //	out.println("<td>"+break3y+"</td>");
    	//out.println("</tr>"); 
    	
 	}
	avg3y=sumbreak3y/count3y++;
	avg3y=Math.round(avg3y*100.0)/100.0;
	count3y=0;
	payg3y_total=Math.round(payg3y_total*100.0)/100.0;
	ripayg3y_total=Math.round(ripayg3y_total*100.0)/100.0;
	ri3ysaving_total=Math.round(ri3ysaving_total*100.0)/100.0;
%> 
<tr>
<th style="width: 65px; text-align: center;">Total</th>

<td style="width: 65px; text-align: center;"></td>
<td style="width: 65px; text-align: center;"></td>
<td style="width: 65px; "><b><% out.println(totalmeter); %></b></td>
<td style="width: 65px;"><b><% out.println(payg3y_total); %></b></td>
<td style="width: 65px; "><b><% out.println(ripayg3y_total); %></b></td>
<td style="width: 65px; "><b><% out.println(ri3ysaving_total); %></b></td>
<td style="width: 65px; "><b><%out.println(avg3y); %></b></td>
</tr> 
</tbody>
</center>
</table>

</td>
</tr>
</tbody>
</table>
<p><strong>&nbsp;</strong></p>
<table id="customers">
<tbody>
<tr>
<td style="width: 581px;">
<table style="height: 56px;" >
<tbody>
<tr>
<th style="width: 64px; text-align: center;">Resource Group</th>
<th style="width: 64px; text-align: center;">Instance ID</th>
<th style="width: 84px; text-align: center;">Unit Price PAYG</th>
<th style="width: 64px; text-align: center;">PAYG 3 Y</th>
<th style="width: 64px; text-align: center;">RI 3 Y</th>
<th style="width: 64px; text-align: center;">Savings</th>
<th style="width: 64px; text-align: center;">Meter Name</th>

</tr>
<%
	for (SummaryTableDataSet eachObject : objectofOneClient) {
		count2++;
		out.println("<tr>");
    	out.println("<td>"+eachObject.getResourceGroup()+"</td>");
    	out.println("<td>"+eachObject.getInstanceId()+"</td>");
    	out.println("<td>"+Math.round(eachObject.getUnitPrice_PAYG()*100.0)/100.0+"</td>");
    	out.println("<td>"+Math.round(eachObject.getPAYG_3Y()*100.0)/100.0+"</td>");
    	out.println("<td>"+Math.round(eachObject.getRI_3Y_PAYGPrice()*100.0)/100.0+"</td>");
    	out.println("<td>"+Math.round((eachObject.getPAYG_3Y()-eachObject.getRI_3Y_PAYGPrice()) * 100.0) / 100.0+"</td>");
    	out.println("<td>"+eachObject.getMeterName()+"</td>");
    	out.println("</tr>");
    	payg3y=payg3y+eachObject.getPAYG_3Y();
    	ri3ypayg=ri3ypayg+eachObject.getRI_3Y_PAYGPrice();
    	ri3ysaving=ri3ysaving+(eachObject.getPAYG_3Y()-eachObject.getRI_3Y_PAYGPrice());
    	unitPlace3y=unitPlace3y+eachObject.getUnitPrice_PAYG();
 	}
	 place=0;
	 cnf=1;
%> 
<tr>
<td style="width: 64px;"><b>Total</b></td>
<td style="width: 64px;">&nbsp;</td>
<td style="width: 64px;"><b><%out.println(Math.round(unitPlace3y*100.0)/100.0); %></b></td>
<td style="width: 64px;"><b><%out.println(Math.round(payg3y*100.0)/100.0); %></b></td>
<td style="width: 64px;"><b><%out.println(Math.round(ri3ypayg*100.0)/100.0); %></b></td>
<td style="width: 64px;"><b><% out.println(Math.round(ri3ysaving*100.0)/100.0); %></b></td>
<td style="width: 64px;"></td>

</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</body>
</html>
