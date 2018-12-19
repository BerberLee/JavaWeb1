<%@ page contentType="text/html;charset=UTF-8" language="java" trimDirectiveWhitespaces="true" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="http://www.SaberLee.com" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Employee Page</title>
    <style>
        table{
            border: 2px solid black;
            border-spacing:15px;
        }
        th{
            background-color: green;
            color: white;
            padding: 15px;
        }
        td{
            background-color: blue;
            color: white;
            padding: 15px;
        }
    </style>
</head>
<body>
<c:set var="employee" value="${requestScope.employee}"/>
<table>
    <tr>
        <th>Employee Id</th>
        <th>First Name</th>
        <th>Last Name</th>
        <th>Email</th>
        <th>Phone Number</th>
        <th>Hire Date</th>
        <th>Salary</th>
 </tr>
    <tr>
        <td><c:out value="${employee.employeeId}"/></td>
        <td><c:out value="${employee.firstName}"/></td>
        <td><c:out value="${employee.lastName}"/></td>
        <td><c:out value="${employee.email}"/></td>
        <td><c:out value="${employee.phoneNumber}"/></td>
        <td><fmt:formatDate value="${employee.hireDate}" pattern="yyyy/MM/dd"/></td>
        <td><c:out value="${employee.salary}"/></td>
    </tr>
</table><br/>
<br/>
<a href="${pageContext.request.contextPath}/index.jsp">Back To Main Page</a>
</body>
</html>
