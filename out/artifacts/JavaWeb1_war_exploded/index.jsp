<%@ page contentType="text/html;charset=UTF-8" language="java" trimDirectiveWhitespaces="true" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="http://www.SaberLee.com" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Main Page</title>
    <style>
        .d1 {
            width: 550px;
            padding: 15px;
        }

        #previousForm {
            float: left;

        }

        #nextForm {
            float: right;

        }
        #previousSubmit{
            font-size: 20px;
            padding: 6px;
        }
        #nextSubmit{
           font-size: 20px;
            padding: 6px;
        }

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
<c:set var="countemployee" value="${s:getCountEmployee()}"/>
<c:set var="minId" value="1"/>
<c:set var="maxId" value="10"/>
<c:if test="${pageContext.request.method=='POST'}">
    <c:if test="${param.minId!=null}">
        <c:set var="minId" value="${param.minId}"/>
    </c:if>

    <c:if test="${param.maxId!=null}">
        <c:set var="maxId" value="${param.maxId}"/>
    </c:if>


</c:if>
<div class="d1">
    <c:if test="${minId>10}">
        <form action="index.jsp" id="previousForm" method="post">
            <input type="hidden" name="minId" value="${minId-10}">
            <input type="hidden" name="maxId" value="${maxId-10}">
            <input type="submit" id="nextSubmit" value="Previous 10 Employees">
        </form>
    </c:if>

    <c:if test="${maxId<countemployee}">
        <form action="index.jsp" id="nextForm" method="post">
            <input type="hidden" name="minId" value="${minId+10}">
            <input type="hidden" name="maxId" value="${maxId+10}">
            <input type="submit" id="previousSubmit" value="Next 10 Employees">
        </form>
    </c:if>
</div>

<br/><br/>
<table >
    <caption><span>Min Id : ${minId} / Max Id ${maxId} From  ${countemployee} </span></caption>
    <tr>
        <th>Employee Id</th>
        <th>First Name</th>
        <th>Last Name</th>
        <th>Email</th>
        <th>Phone Number</th>
        <th>Hire Date</th>
        <th>Salary</th>
    </tr>
    <c:forEach items="${s:getEmployees(minId+100, maxId+100)}" var="employee">
        <tr>
            <td><c:out value="${employee.employeeId}"/></td>
            <td><c:out value="${employee.firstName}"/></td>
            <td><c:out value="${employee.lastName}"/></td>
            <td><c:out value="${employee.email}"/></td>
            <td><c:out value="${employee.phoneNumber}"/></td>
            <td><fmt:formatDate value="${employee.hireDate}" pattern="yyyy/MM/dd"/></td>
            <td><c:out value="${employee.salary}"/></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
