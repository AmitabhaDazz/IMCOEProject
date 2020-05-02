<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<h1>The file you have selected is</h1>

      <ul>
         <li><p><b>File Name:</b>
            <%= request.getParameter("excelfile")%>

         </p></li>
      </ul>
</body>
</html>