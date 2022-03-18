<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!Doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>

<h2>All Clients</h2>

<table>
    <tr>
        <th>Name</th>
        <th>Address</th>
        <th>Client_number</th>
        <th>Tel_number</th>
    </tr>

    <c:forEach var="client" items="${allClients}">

            <c:url var="updateButton" value="/updateClient">
                <c:param name="clientId" value="${client.id}"/>
            </c:url>

            <c:url var="deleteButton" value="/deleteClient">
                <c:param name="clientId" value="${client.id}"/>
            </c:url>

        <tr>
            <td>${client.name}</td>
            <td>${client.address}</td>
            <td>${client.client_number}</td>
            <td>${client.tel_number}</td>
            <td>
                <input type="button" value="Update"
                       onclick="window.location.href='${updateButton}'"/>
                <input type="button" value="Delete"
                       onclick="window.location.href='${deleteButton}'"/>
            </td>
        </tr>


    </c:forEach>
</table>

<br>

<input type="button" value="Add"
    onclick="window.location.href = 'addNewClient'"/>

</body>
</html>