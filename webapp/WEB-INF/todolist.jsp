<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <link rel="stylesheet" href="todolist.css">
    <title>ToDoList7 </title>
</head>

<body>

    <div class=title>To Do List #7 -- Private for ${user.userName}</div>

    <form class="add-form" method="POST" action="add.do">
        <input type="hidden" name="csrfToken" value="${ csrfToken }" />
        <table>
            <c:forEach var="field" items="${form.visibleFields}">
                <tr>
                    <td>
                        <label>${field.label}</label>
                    </td>
                    <td>
                        <input type="${field.type}" name="${field.name}" value="${field.value}" autofocus/>
                    </td>
                    <td>
                        <span class="error">${field.error}</span>
                    </td>
                </tr>
            </c:forEach>
            <tr>
                <td></td>
                <td colspan="2">
                        <button type="submit" name="action" value="top">Add to Top</button>
                        <button type="submit" name="action" value="bottom">Add to Bottom</button>
                </td>
            </tr>
        </table>
    </form>

    <c:forEach var="error" items="${form.formErrors}">
        <p class="error"> ${error} </p>
    </c:forEach>

    <div class="sub-title"> Current todo list has ${ fn:length(items) } items: </div>

    <ol>
        <c:forEach var="item" items="${items}">
            <li>
                <form class="delete-form" method="POST" action="delete.do">
                    <input type="hidden" name="id" value="${ item.id }" />
                    <input type="hidden" name="csrfToken" value="${ csrfToken }" />
                    <button type="submit">X</button>
                </form>
	           <c:out value="${ item.item }" />
                <span class="details">
                    (uniqueId = ${ item.id },
                    user = ${ item.userName },
                    ipAddr = ${ item.ipAddress })
                </span>
            </li>
		</c:forEach>
	</ol>


    <form method="POST" action="logout.do">
        <input type="hidden" name="csrfToken" value="${ csrfToken }" />
        <button type="submit">Logout</button>
    </form>
    
    <hr/>

    <form method="POST" action="delete-all.do">
        <input type="hidden" name="csrfToken" value="${ csrfToken }" />
        <button type="submit">Delete My Entire List</button>
    </form>
</body>
</html>
