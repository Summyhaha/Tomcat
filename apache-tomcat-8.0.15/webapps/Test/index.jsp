<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<html>
	<head>
		<title>Tomcat Session Demo</title>
	</head>
	<body>
	<b>Server Info:</b>
	<%
		out.println(request.getLocalAddr() + " : " + request.getLocalPort()+"<br>");
	%>
	<%
		out.println("<br><b>Session ID : </b>" + session.getId()+"<br>");
  
	String dataName = request.getParameter("dataName");
  	if (dataName != null && dataName.length() > 0) {
     	String dataValue = request.getParameter("dataValue");
    	session.setAttribute(dataName, dataValue);
     	System.out.println("application : " + application.getAttribute(dataName));
     	application.setAttribute(dataName, dataValue);
  	}
  	
  	out.println("<br><b>Session Attribute List :</b><br>");
  	Enumeration<String> e = session.getAttributeNames();
  	while (e.hasMoreElements()) {
     	String name = e.nextElement();
     	String value = session.getAttribute(name).toString();
     	out.println( name + " = " + value+"<br>");
     	System.out.println( name + " = " + value);
   }
   /*function o(){
   		out.println("Session created time is :"+session.getCreationTime()+"<br>");
   }*/
%>
	<form action="index.jsp" method="POST">
    	<b>Name:</b><input type=text size=20 name="dataName"><br>
    	<b>Value:</b><input type=text size=20 name="dataValue"><br>
    	<input type=submit onclick="this.form.submit()">
   	</form>
</body>
</html>